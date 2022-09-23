import 'package:flutter/material.dart';
import 'package:trabalho_todo/database/dao/task_dao.dart';
import 'package:trabalho_todo/database/entities/task.dart';

class TaskTile extends StatefulWidget {
  Task task;
  TaskDao? taskDao;

  TaskTile({
    required this.task,
    required this.taskDao,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool newValue = !widget.task.done;
        widget.task.done = newValue;
        widget.taskDao?.updateTask(widget.task);
        changeChecked(newValue);
      },
      onLongPress: () {
        widget.taskDao?.deleteTask(widget.task);
      },
      child: ListTile(
        title: Text(
          widget.task.taskText,
          style: TextStyle(
              decoration: widget.task.done ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: widget.task.done,
          onChanged: changeChecked,
        ),
      ),
    );
  }

  void changeChecked(bool? value) {
    setState(() {
      widget.task.done = value!;
    });
  }
}
