import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  TaskDetailsScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              task.isDone ? 'Completada' : 'Pendiente',
              style: TextStyle(fontSize: 18, color: task.isDone ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
