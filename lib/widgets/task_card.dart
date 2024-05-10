import 'package:b4a_task_tracker/modules/task/controllers/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/task/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    if (task.done == true) {
      return Card(
        color: Colors.green[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(task.title!), Text(task.description!)],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  controller.deleteTask(task.objectId!);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(task.title!), Text(task.description!)],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.updateTask(task.objectId!, true);
              },
              icon: Icon(Icons.done),
            ),
            IconButton(
              onPressed: () {
                controller.deleteTask(task.objectId!);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
