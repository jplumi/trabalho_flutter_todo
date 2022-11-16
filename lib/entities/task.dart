class Task {
  String? id;
  String desc;
  bool done;

  Task(this.desc, this.done, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'desc': desc,
      'done': done,
    };
  }
}
