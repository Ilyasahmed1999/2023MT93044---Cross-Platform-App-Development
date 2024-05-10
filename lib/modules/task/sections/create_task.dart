import 'package:b4a_task_tracker/models/task/task.dart';
import 'package:b4a_task_tracker/modules/task/controllers/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return Column(children: [
      TextField(
        controller: controller.taskTitle,
        decoration: InputDecoration(
            hintText: "Task Title",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 3.0))),
      ),
      const SizedBox(
        height: 12,
      ),
      TextField(
        controller: controller.taskDesc,
        decoration: InputDecoration(
            hintText: "Task Description",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 3.0))),
      ),
      const SizedBox(
        height: 16,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () async {
              await controller.saveTodo();
            },
            child: const Text("Add Task")),
      )
    ]);
  }

  Future<List<Task>> getTask() async {
    QueryBuilder<ParseObject> queryTask =
        QueryBuilder<ParseObject>(ParseObject('task'));
    final ParseResponse apiResponse = await queryTask.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<Task>;
    } else {
      return [];
    }
  }
}
