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
import 'package:wowca_task/features/task/app/pages/create_task.dart';
import 'package:wowca_task/features/task/app/pages/task_list_tile.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/app/page/signup_page.dart';
import 'package:wowca_task/features/user_registration/data/model/signed_in_user_model.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class TaskApp extends StatefulWidget {
  final Map<String, dynamic> user;

  const TaskApp({Key key, this.user}) : super(key: key);

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
      home: TaskListItem(),
      // home: widget.user == null || widget.user.isEmpty
      //     ? SignInPage()
      //     : DashboardPage(
      //         user: SignedInUserModel.fromJson(widget.user),
      //       ),
      //  ModulePage(
      //       project: Project(
      //           projectId: '1',
      //           projectName: 'TaskMan',
      //           department: 'St. Isidore\'s TechHub',
      //           listOfModules: [
      //             Module(
      //                 moduleId: '1',
      //                 moduleName: 'task manager module',
      //                 percentCompletion: 0.0,
      //                 projectName: 'TaskMan',
      //                 listOfTasks: [
      //                   TaskItem(
      //                     taskName: 'Text Task 1',
      //                     started: true,
      //                     completed: true,
      //                     description: 'creating an egg',
      //                     moduleName: 'task manager module',
      //                   ),
      //                   TaskItem(
      //                     taskName: 'Text Task 2',
      //                     started: false,
      //                     completed: false,
      //                     description: 'mixing soup',
      //                     moduleName: 'task manager module',
      //                   ),
      //                   TaskItem(
      //                     taskName: 'Text Task 3',
      //                     started: true,
      //                     completed: false,
      //                     description: 'grind the beans',
      //                     moduleName: 'task manager module',
      //                   ),
      //                   TaskItem(
      //                     taskName: 'Text Task 4',
      //                     started: false,
      //                     completed: true,
      //                     description: 'sit down and enjoy the moi moi',
      //                     moduleName: 'task manager module',
      //                   ),
      //                 ]),
      //             Module(),
      //             Module(),
      //           ]),
      //     ),
    );
  }

  Future<void> verifyPermissions() async {
    await [Permission.microphone, Permission.camera].request();
  }
}
