import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_list_item.dart';

class AddTaskPage extends StatefulWidget {
  @override
  AddTaskPageState createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _projectFieldController;

  TextEditingController _moduleTextFieldController;

  List<Project> projectList = [];

  List<Module> moduleList = [];

  bool _validate = false;

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
      projectList.add(Project(projectName: _projectFieldController.text));
      _projectFieldController.clear();
    } else {
      _validate = true;
    }
  }

  void removeProject(Project project) {
    projectList.remove(project);
  }

  void createModule() {
    moduleList.add(Module(moduleName: _moduleTextFieldController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Project',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Container(
                width: 250.0,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _projectFieldController,
                        decoration: InputDecoration(
                          //labelText: 'Create a Project',
                          hintText: 'Project Name',
                          errorText:
                              _validate ? AppStrings.projectHasNoName : null,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _validate = false;
                          });
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Please Enter a project name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    InkWell(
                      onTap: () {
                        //create a project
                        setState(() {
                          createProject();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Quantity.addButtonSquareSide,
                        height: Quantity.addButtonSquareSide,
                        color: Colors.greenAccent,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectList.length,
                    itemBuilder: (context, index) {
                      return ProjectListItem(
                        project: projectList[index],
                        removeProject: (value) {
                          setState(() {
                            removeProject(value);
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
