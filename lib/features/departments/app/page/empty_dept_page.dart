import 'package:flutter/material.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

class EmptyDeptPage extends StatefulWidget {
  final DeptEntity dept;

  const EmptyDeptPage({Key key, this.dept}) : super(key: key);

  @override
  _EmptyDeptPageState createState() => _EmptyDeptPageState();
}

class _EmptyDeptPageState extends State<EmptyDeptPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
