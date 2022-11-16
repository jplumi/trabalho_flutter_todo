import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trabalho_todo/controller/task_controller.dart';
import 'package:trabalho_todo/entities/task.dart';

class TaskTile extends StatelessWidget {
  Task task;
  Function(int taskId) onRemoveCallback;

  final _controller = Get.find<TaskController>();

  TaskTile({
    required this.task,
    required this.onRemoveCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (direction) {
        _controller.removeTask(task.id);
      },
      child: InkWell(
        onTap: () {
          bool newValue = !task.done;
          task.done = newValue;
          changeChecked(newValue);
        },
        onLongPress: () {},
        child: ListTile(
          title: Text(
            task.desc,
            style: TextStyle(
                decoration: task.done ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            activeColor: Colors.blueGrey,
            value: task.done,
            onChanged: changeChecked,
          ),
        ),
      ),
    );
  }

  void changeChecked(bool? value) {
    _controller.updateTask(task.id!, value!);
  }
}
