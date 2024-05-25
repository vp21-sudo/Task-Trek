class Task {
  int id;
  String taskName;
  bool completed;
  String createdAt;
  String updatedAt;

  Task({
    required this.id,
    required this.taskName,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'completed': completed ? 1 : 0,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskName: map['taskName'],
      completed: map['completed'] == 1,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
}
