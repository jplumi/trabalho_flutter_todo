import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String taskText;
  bool done;

  Task(this.taskText, this.done, {this.id});
}
