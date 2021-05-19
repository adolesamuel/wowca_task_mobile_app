import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/task/app/pages/create_task.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class TaskPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const TaskPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTaskPage()));
        },
      ),
    );
  }
}
