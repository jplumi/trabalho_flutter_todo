import 'package:floor/floor.dart';
import 'package:trabalho_todo/database/entities/task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> findAll();

  @update
  Future<int> updateTask(Task task);

  @insert
  Future<int> insertTask(Task task);

  @delete
  Future<int> deleteTask(Task task);
}
