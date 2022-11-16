import 'package:flutter/material.dart';
import 'package:trabalho_todo/entities/task.dart';

class TaskTile extends StatefulWidget {
  Task task;
  Function(int taskId) onRemoveCallback;

  TaskTile({
    required this.task,
    required this.onRemoveCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.task.id.toString()),
      onDismissed: (direction) {
        // widget.taskDao?.deleteTask(widget.task).then((value) {
        //   if (value >= 1) {
        //     widget.onRemoveCallback(widget.task.id!);
        //   }
        // });
      },
      child: InkWell(
        onTap: () {
          bool newValue = !widget.task.done;
          widget.task.done = newValue;
          // widget.taskDao?.updateTask(widget.task);
          changeChecked(newValue);
        },
        onLongPress: () {},
        child: ListTile(
          title: Text(
            widget.task.taskText,
            style: TextStyle(
                decoration:
                    widget.task.done ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            activeColor: Colors.blueGrey,
            value: widget.task.done,
            onChanged: changeChecked,
          ),
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
