import 'package:flutter/material.dart';
import 'package:todoey_app/models/task.dart';
import 'package:collection/collection.dart';

class TaskData extends  ChangeNotifier{
  List<Task> _tasks = [
    Task(taskDescription: "first task"),
    Task(taskDescription: "second task")
  ];

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String taskTitle){
    _tasks.add(Task(taskDescription: taskTitle));
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}