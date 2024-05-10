import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../models/task/task.dart';

class TaskController extends GetxController {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TextEditingController? taskTitle;
  TextEditingController? taskDesc;

  @override
  void onInit() async {
    super.onInit();
    taskTitle = TextEditingController();
    taskDesc = TextEditingController();
    await getTask();
  }

  Future<void> saveTodo() async {
    final todo = ParseObject('task')
      ..set('title', taskTitle!.text)
      ..set('description', taskDesc!.text)
      ..set('done', false);
    await todo.save();
    await getTask();
  }

  Future<void> getTask() async {
    QueryBuilder<ParseObject> queryTask =
        QueryBuilder<ParseObject>(ParseObject('task'));
    final ParseResponse apiResponse = await queryTask.query();
    if (apiResponse.success && apiResponse.results != null) {
      _tasks = [];
      apiResponse.results?.forEach((element) {
        _tasks.add(Task(
            objectId: element.get<String>('objectId'),
            title: element.get<String>('title'),
            description: element.get<String>('description'),
            done: element.get<bool>('done')));
      });
      update();
    }
  }

  Future<void> updateTask(String id, bool done) async {
    var task = ParseObject('task')
      ..objectId = id
      ..set('done', done);
    await task.save();
    await getTask();
  }

  Future<void> deleteTask(String id) async {
    var todo = ParseObject('task')..objectId = id;
    await todo.delete();
    await getTask();
  }
}
