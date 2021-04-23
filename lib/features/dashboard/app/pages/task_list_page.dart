import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/datatable_for_module..dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';

class TaskListPage extends StatefulWidget {
  final Module module;

  const TaskListPage({Key key, this.module}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

//using a data table to show the list of really long files using

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.module.moduleName}\'s tasks'),
      ),
      body: DataTableForModule(module: widget.module),
    );
  }
}
