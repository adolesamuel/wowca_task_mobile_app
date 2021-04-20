import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
