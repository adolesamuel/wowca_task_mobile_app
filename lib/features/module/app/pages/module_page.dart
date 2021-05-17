import 'package:flutter/material.dart';
import 'package:wowca_task/features/module/app/pages/create_module_page.dart';
import 'package:wowca_task/features/module/app/pages/module_body.dart';

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
      body: ModuleBody(),
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
