import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wowca_task/features/module/app/pages/create_module_page.dart';

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module'),
      ),
      body: Center(
        child: Text('Under Construction'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateModulePage()));
        },
      ),
    );
  }
}
