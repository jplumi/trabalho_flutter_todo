import 'package:flutter/material.dart';
import 'package:trabalho_todo/entities/task.dart';
import 'package:trabalho_todo/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  TasksList({
    required this.tasks,
    Key? key,
  }) : super(key: key);

  List<Task> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  void removeTask(int taskId) {
    setState(() {
      widget.tasks.removeWhere((task) => task.id == taskId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) => TaskTile(
        task: widget.tasks[index],
        onRemoveCallback: removeTask,
      ),
    );
  }
}
