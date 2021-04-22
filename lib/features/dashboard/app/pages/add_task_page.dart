import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_list_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/text_field_widget.dart';

class AddTaskPage extends StatefulWidget {
  @override
  AddTaskPageState createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _projectFieldController;

  TextEditingController _moduleTextFieldController;

  Project _project;

  bool _validateProjectName = false;

  @override
  void initState() {
    super.initState();
    _projectFieldController = TextEditingController();
    _moduleTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _projectFieldController.dispose();
    _moduleTextFieldController.dispose();
    super.dispose();
  }

  void createProject() {
    if (_projectFieldController.text.isNotEmpty) {
      _project = Project(
        projectName: _projectFieldController.text,
        listOfModules: [],
      );
      _projectFieldController.clear();
    } else {
      _validateProjectName = true;
    }
  }

  void removeProject(Project project) {
    _project = null;
  }

  void removeModule(int mark) {
    _project.listOfModules.removeAt(mark);
  }

  void createModule() {
    _project.listOfModules.add(
        Module(moduleName: _moduleTextFieldController.text, listOfTasks: []));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Create Project Textfield widget
              // only shows if user is
              // an admin or a supervisor
              CustomTextFieldWidget(
                textFieldTitle: 'Create Project',
                textFieldController: _projectFieldController,
                hintText: 'Project Name',
                validate: _validateProjectName,
                onChanged: (value) {
                  setState(() {
                    _validateProjectName = false;
                  });
                },
                onTapAddButton: () {
                  setState(() {
                    createProject();
                  });
                },
              ),
              SizedBox(height: 10.0),
              _project != null
                  ? Container(
                      height: 300.0,
                      child: Column(
                        children: [
                          ProjectListItem(
                            project: _project,
                            removeProject: (value) {
                              setState(() {
                                removeProject(value);
                              });
                            },
                            addModule: (Project value) {
                              //create module text field for project on a listview
                            },
                          ),
                        ],
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
