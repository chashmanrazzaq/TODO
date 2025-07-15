class Task {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime date;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.date,
  });
}