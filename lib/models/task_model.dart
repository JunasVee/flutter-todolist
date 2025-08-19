import 'package:flutter/material.dart';

class TaskModel {
  final String taskName;
  final Color textColor;
  bool isDone;

  TaskModel({
    required this.taskName,
    this.textColor = Colors.black,
    this.isDone = false,
  });

  static List<TaskModel> getTasks() {
    List<TaskModel> tasks = [];

    tasks.add(
      TaskModel(
        taskName: 'Cook for breakfast',
        textColor: Colors.green,
        isDone: false,
      )
    );

    tasks.add(
      TaskModel(
        taskName: 'Go to gym',
        textColor: Colors.black,
        isDone: false,
      )
    );

    tasks.add(
      TaskModel(
        taskName: 'Study for exam',
        textColor: Colors.redAccent,
        isDone: false,
      )
    );

    return tasks;
  }
}