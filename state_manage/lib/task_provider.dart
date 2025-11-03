import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add({'title': title, 'done': false});
    notifyListeners(); // tells the UI to refresh
  }

  void toggleDone(int index) {
    _tasks[index]['done'] = !_tasks[index]['done'];
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
