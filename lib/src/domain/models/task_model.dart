
class Task {
  String task;
  String dateTask;
  String docIndexTask;
  String id;

  Task(
      {required this.task,
      required this.dateTask,
      required this.docIndexTask,
      required this.id});

  factory Task.fromJSON(Map<String, dynamic> json, String id) {
    return Task(
        task: json["task"],
        dateTask: json["dateTask"],
        docIndexTask: json["userId"],
        id: id);
  }
}

