import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

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
                autofocus: true,
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: (() {}),
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
