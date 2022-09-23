import 'package:flutter/material.dart';
import 'package:trabalho_todo/database/dao/task_dao.dart';
import 'package:trabalho_todo/database/entities/task.dart';
import 'package:trabalho_todo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  TasksList({
    required this.tasks,
    required this.taskDao,
    Key? key,
  }) : super(key: key);

  List<Task> tasks;
  TaskDao? taskDao;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskTile(
        task: tasks[index],
        taskDao: taskDao,
      ),
    );
  }
}
