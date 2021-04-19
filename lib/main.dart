import 'package:flutter/material.dart';
import 'package:wowca_task/features/user_registration/app/registration_page.dart';

import 'package:wowca_task/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Await [Dependency_injection] processing
  ///using Get_it package
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RegistrationPage(),
    );
  }
}
