import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trabalho_todo/controller/task_controller.dart';
import 'package:trabalho_todo/entities/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  String? textValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                cursorColor: Colors.blueGrey,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  textValue = value;
                },
                autofocus: true,
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                if (textValue != null) {
                  Task newTask = Task(textValue!, false);
                  Get.find<TaskController>().addTask(newTask);
                  Get.back();
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
