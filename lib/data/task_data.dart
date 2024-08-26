import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks.where((task) => !task.isDone).toList();
  List<Task> get completedTasks => _tasks.where((task) => task.isDone).toList();

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(title: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
