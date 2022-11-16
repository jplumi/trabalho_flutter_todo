import 'package:flutter/material.dart';
import 'package:trabalho_todo/entities/task.dart';
import 'package:trabalho_todo/screens/add_task_screen.dart';
import 'package:trabalho_todo/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo'),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteDialog();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Future future = Navigator.push(context,
              MaterialPageRoute(builder: ((context) => AddTaskScreen())));
          future.then((newTask) {
            if (newTask != null) {
              // taskDao?.insertTask(newTask).then((taskId) {
              //   if (taskId >= 0) {
              //     newTask.id = taskId;
              //     setState(() {
              //       tasks.add(newTask);
              //     });
              //   }
              // });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: TasksList(
        tasks: tasks,
      ),
    );
  }

  Future<void> _showDeleteDialog() async {
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
                _deleteAllTasks();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAllTasks() {
    // taskDao?.deleteAllTasks().then(
    //   (value) {
    //     setState(() {
    //       tasks.clear();
    //     });
    //   },
    // );
  }
}
