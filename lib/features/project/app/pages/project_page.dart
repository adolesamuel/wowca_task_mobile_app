import 'package:flutter/material.dart';
import 'package:wowca_task/features/project/app/pages/project_body.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
      ),
      body: ProjectBody(),
    );
  }
}
