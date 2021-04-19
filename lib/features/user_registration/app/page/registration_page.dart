import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WOWCA Task'),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          height: 100.0,
          width: 100.0,
          child: Text('Registration Page'),
        ),
      ),
    );
  }
}
