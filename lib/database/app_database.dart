import 'dart:async';
import 'package:floor/floor.dart';
import 'package:trabalho_todo/database/dao/task_dao.dart';
import 'package:trabalho_todo/database/entities/task.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
