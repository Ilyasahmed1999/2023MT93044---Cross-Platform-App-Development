import 'package:b4a_task_tracker/modules/task/sections/create_task.dart';
import 'package:b4a_task_tracker/modules/task/sections/view_tasks.dart';
import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CreateTask(),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: ViewTasks()),
          ],
        ),
      ),
    );
  }
}
