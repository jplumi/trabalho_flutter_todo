import 'package:flutter/material.dart';
import 'package:trabalho_todo/screens/task_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      home: TasksScreen(),
    );
  }
}
