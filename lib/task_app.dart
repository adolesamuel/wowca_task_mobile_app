import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/pages/dashboard_page.dart';
import 'package:wowca_task/features/departments/data/models/get_dept.dart';
import 'package:wowca_task/features/user_registration/app/page/signIn_page.dart';
import 'package:wowca_task/features/user_registration/data/model/signed_in_user_model.dart';

class TaskApp extends StatefulWidget {
  final Map<String, dynamic> user;
  final Map<String, dynamic> dept;

  const TaskApp({Key key, this.user, this.dept}) : super(key: key);

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
      home: widget.user == null || widget.user.isEmpty
          ? SignInPage()
          : DashboardPage(
              user: SignedInUserModel.fromJson(widget.user),
              dept: DeptModel.fromJson(widget.dept),
            ),
    );
  }

  Future<void> verifyPermissions() async {
    await [Permission.microphone, Permission.camera].request();
  }
}
