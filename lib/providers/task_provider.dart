import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  String _filter = 'All';

  List<Task> get tasks {
    if (_filter == 'Completed') {
      return _tasks.where((task) => task.isCompleted).toList();
    } else if (_filter == 'Pending') {
      return _tasks.where((task) => !task.isCompleted).toList();
    }
    return _tasks;
  }

  String get filter => _filter;

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleCompletion(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  int get todayTasksCount {
    final today = DateTime.now();
    return _tasks.where((task) =>
    task.date.day == today.day &&
        task.date.month == today.month &&
        task.date.year == today.year &&
        !task.isCompleted).length;
  }
}