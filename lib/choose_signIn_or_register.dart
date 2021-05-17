import 'package:flutter/material.dart';

class SignInOrRegisterChooser extends StatefulWidget {
  @override
  _SignInOrRegisterChooserState createState() =>
      _SignInOrRegisterChooserState();
}

class _SignInOrRegisterChooserState extends State<SignInOrRegisterChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Task Manager app chose between login or signup')),
    );
  }
}
