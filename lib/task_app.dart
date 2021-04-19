import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wowca_task/core/utils/strings.dart';

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
          ? SignUp()
          : Dashboard(),
    );
  }

  Future<void> verifyPermissions() async {
    await [Permission.microphone, Permission.camera].request();
  }
}
