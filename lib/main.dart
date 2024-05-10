import 'package:b4a_task_tracker/modules/task/controllers/tasks_controller.dart';
import 'package:b4a_task_tracker/modules/task/views/task_view.dart';
import 'package:b4a_task_tracker/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'Na0Fj8EirKbRdKgGcI7iuLhFQG1tQsi9jMbQSsil';
  const keyClientKey = "FurOzz1EXZLLb4yzqejbILEnkSKfI69rZT15e3Tr";
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
  Get.put(TaskController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: CustomTheme.lightColorScheme,
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromARGB(255, 164, 165, 240)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: CustomTheme.darkColorScheme,
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromARGB(255, 59, 148, 106)),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const TasksView(),
    );
  }
}
