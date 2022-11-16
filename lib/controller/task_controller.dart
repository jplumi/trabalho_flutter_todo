import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:trabalho_todo/entities/task.dart';

class TaskController extends GetxController {
  final tasks = <String, Task>{}.obs;

  final _firestore = FirebaseFirestore.instance;

  StreamSubscription? _tasksStream;

  @override
  void onInit() {
    super.onInit();
    getAllTasks();
  }

  @override
  void onClose() {
    super.onClose();
    if (_tasksStream != null) {
      _tasksStream!.cancel();
    }
  }

  getAllTasks() async {
    _tasksStream =
        _firestore.collection('tasks').snapshots().listen((snapshot) {
      tasks.clear();
      for (var doc in snapshot.docs) {
        final data = doc.data();
        tasks[doc.id] = Task(data['desc'], data['done'], id: doc.id);
      }
    });
  }

  addTask(Task task) {
    _firestore.collection('tasks').add(task.toMap());
  }

  updateTask(String taskId, bool value) {
    _firestore.collection('tasks').doc(taskId).update({'done': value});
  }

  removeTask(taskId) {
    _firestore.collection('tasks').doc(taskId).delete();
  }
}
