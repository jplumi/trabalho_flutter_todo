import 'package:flutter/material.dart';
import 'package:trabalho_todo/screens/add_task_screen.dart';
import 'package:trabalho_todo/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Todo'),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text('12 Tasks'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddTaskScreen())));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: TasksList(),
      ),
    );
  }
}
