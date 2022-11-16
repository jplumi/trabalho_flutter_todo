import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_todo/firebase_options.dart';
import 'package:trabalho_todo/screens/task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const TasksScreen(),
    );
  }
}
