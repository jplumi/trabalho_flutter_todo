import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trabalho_todo/controller/task_controller.dart';
import 'package:trabalho_todo/screens/add_task_screen.dart';
import 'package:trabalho_todo/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo'),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteDialog(context);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _controller.tasks.length,
          itemBuilder: (context, index) => TaskTile(
            task: _controller.tasks.values.elementAt(index),
            onRemoveCallback: Get.find<TaskController>().removeTask,
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete all tasks?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete all tasks?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes, delete'),
              onPressed: () {
                print('delete all tasks');
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
