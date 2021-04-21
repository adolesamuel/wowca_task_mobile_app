import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/module_list_item.dart';
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

  List<Project> projectList = [];

  bool _validateProjectName = false;

  bool _moduleTextFieldIsVisible = false;

  bool _validateModuleName = false;

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
      projectList.add(Project(
        projectName: _projectFieldController.text,
        listOfModules: [],
      ));
      _projectFieldController.clear();
    } else {
      _validateProjectName = true;
    }
  }

  void removeProject(Project project) {
    projectList.remove(project);
  }

  void removeModule(int index, int mark) {
    projectList[index].listOfModules.removeAt(mark);
  }

  void createModule(int index) {
    projectList[index].listOfModules.add(
        Module(moduleName: _moduleTextFieldController.text, listOfTasks: []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Create Project Textfield widget
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
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ProjectListItem(
                              project: projectList[index],
                              removeProject: (value) {
                                setState(() {
                                  removeProject(value);
                                });
                              },
                              addModule: (Project value) {
                                //create module text field for project on a listview
                                print(value.projectName);
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomTextFieldWidget(
                              //give this a visibility field so it opens only by choice
                              textFieldTitle: 'Add a Module',
                              validate: _validateModuleName,
                              textFieldController: _moduleTextFieldController,
                              hintText: 'Module Name',
                              onChanged: (value) {
                                setState(() {
                                  _validateModuleName = false;
                                });
                              },
                              onTapAddButton: () {
                                setState(() {
                                  createModule(index);
                                });
                              },
                            ),
                            //
                            //Build horizontal list of created modules
                            //
                            SingleChildScrollView(
                              child: Container(
                                width: 300,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        projectList[index].listOfModules.length,
                                    itemBuilder: (context, mark) {
                                      return Column(
                                        children: [
                                          ModuleListItem(
                                            module: projectList[index]
                                                .listOfModules[mark],
                                            removeModule: (value) {
                                              setState(() {
                                                removeModule(index, mark);
                                              });
                                            },
                                            addTask: (Module value) {
                                              //on tap should create a new page
                                              //where tasks can be added and returned
                                              //to parent module.
                                              //tasks are displayed horizontally on this page.
                                              print(value.moduleName);
                                            },
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
