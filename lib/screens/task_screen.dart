import 'package:flutter/material.dart';
import 'package:trabalho_todo/database/app_database.dart';
import 'package:trabalho_todo/database/dao/task_dao.dart';
import 'package:trabalho_todo/database/entities/task.dart';
import 'package:trabalho_todo/screens/add_task_screen.dart';
import 'package:trabalho_todo/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskDao? taskDao;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    openDatabase();
  }

  openDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    taskDao = database.taskDao;
    tasks = await taskDao?.findAll() ?? [];
    setState(() {});
  }

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
          Future future = Navigator.push(context,
              MaterialPageRoute(builder: ((context) => AddTaskScreen())));
          future.then((newTask) {
            taskDao?.insertTask(newTask).then((taskId) {
              if (taskId >= 0) {
                newTask.id = taskId;
                setState(() {
                  tasks.add(newTask);
                });
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: TasksList(
          tasks: tasks,
          taskDao: taskDao,
        ),
      ),
    );
  }
}
