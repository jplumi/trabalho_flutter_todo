import 'package:flutter/material.dart';
import 'package:trabalho_todo/database/entities/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  String? textValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: TextField(
                onChanged: (value) {
                  textValue = value;
                },
                autofocus: true,
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (textValue != null) {
                  Task task = Task(textValue!, false);
                  Navigator.pop(context, task);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 28),
              ),
            ),
          )
        ],
      ),
    );
  }
}
