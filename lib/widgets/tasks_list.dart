import 'package:flutter/material.dart';
import 'package:trabalho_todo/database/dao/task_dao.dart';
import 'package:trabalho_todo/database/entities/task.dart';
import 'package:trabalho_todo/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  TasksList({
    required this.tasks,
    required this.taskDao,
    Key? key,
  }) : super(key: key);

  List<Task> tasks;
  TaskDao? taskDao;

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
        taskDao: widget.taskDao,
        onRemoveCallback: removeTask,
      ),
    );
  }
}
