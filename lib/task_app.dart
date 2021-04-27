import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/pages/dashboard_page.dart';
import 'package:wowca_task/features/dashboard/app/pages/module_page.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/task_item.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';
import 'package:wowca_task/features/user_registration/app/page/verification_page.dart';

class TaskApp extends StatefulWidget {
  final String accessToken;

  const TaskApp({Key key, this.accessToken}) : super(key: key);

  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  void initState() {
    super.initState();

    verifyPermissions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.deepPurple).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.deepPurple).toTheme,
      themeMode: ThemeMode.system,
      home: widget.accessToken == null || widget.accessToken.isEmpty
          ? VerificationPage()
          :
          // DashboardPage(),
          ModulePage(
              project: Project(
                  projectId: '1',
                  projectName: 'TaskMan',
                  department: 'St. Isidore\'s TechHub',
                  listOfModules: [
                    Module(
                        moduleId: '1',
                        moduleName: 'task manager module',
                        percentCompletion: 0.0,
                        projectName: 'TaskMan',
                        listOfTasks: [
                          TaskItem(
                            taskName: 'Text Task 1',
                            started: true,
                            completed: true,
                            description: 'creating an egg',
                            moduleName: 'task manager module',
                          ),
                          TaskItem(
                            taskName: 'Text Task 2',
                            started: false,
                            completed: false,
                            description: 'mixing soup',
                            moduleName: 'task manager module',
                          ),
                          TaskItem(
                            taskName: 'Text Task 3',
                            started: true,
                            completed: false,
                            description: 'grind the beans',
                            moduleName: 'task manager module',
                          ),
                          TaskItem(
                            taskName: 'Text Task 4',
                            started: false,
                            completed: true,
                            description: 'sit down and enjoy the moi moi',
                            moduleName: 'task manager module',
                          ),
                        ]),
                    Module(),
                    Module(),
                  ]),
            ),
    );
  }

  Future<void> verifyPermissions() async {
    await [Permission.microphone, Permission.camera].request();
  }
}
