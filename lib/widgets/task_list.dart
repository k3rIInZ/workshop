import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final bool isCompleted;

  TaskList({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final tasks = isCompleted ? taskData.completedTasks : taskData.tasks;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              task: task,
              toggleCheckboxState: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
