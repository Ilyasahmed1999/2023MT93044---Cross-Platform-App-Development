import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/task_card.dart';
import '../controllers/tasks_controller.dart';

class ViewTasks extends StatelessWidget {
  const ViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return GetBuilder<TaskController>(builder: (_) {
      if (controller.tasks.isNotEmpty) {
        return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: controller.tasks[index]);
            });
      } else
        return Text("No Tasks!");
    });
  }
}
