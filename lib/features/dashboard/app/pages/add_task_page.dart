import 'package:dropdownfield/dropdownfield.dart';
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

  Project _project;

  bool _validateProjectName = false;

  bool _addModuleTextFieldIsVisible = false;

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
                _project == null
                    ? CustomTextFieldWidget(
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
                      )
                    : Text(''),
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

                                setState(() {
                                  _addModuleTextFieldIsVisible = true;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            _addModuleTextFieldIsVisible
                                ? Column(
                                    children: [
                                      CustomTextFieldWidget(
                                        //give this a visibility field so it opens only by choice
                                        textFieldTitle: 'Add a Module',
                                        validate: _validateModuleName,
                                        textFieldController:
                                            _moduleTextFieldController,
                                        hintText: 'Module Name',
                                        onChanged: (value) {
                                          setState(() {
                                            _validateModuleName = false;
                                          });
                                        },
                                        onTapAddButton: () {
                                          setState(() {
                                            createModule();
                                          });
                                        },
                                      ),
                                      DropDownField(
                                        hintText: 'Add a Module',
                                      ),
                                    ],
                                  )
                                : Text(''),
                            //
                            //Build horizontal list of created modules
                            //
                            // SingleChildScrollView(
                            //   child: Container(
                            //     width: 300,
                            //     child: ListView.builder(
                            //         shrinkWrap: true,
                            //         scrollDirection: Axis.vertical,
                            //         itemCount: _project.listOfModules.length,
                            //         itemBuilder: (context, mark) {
                            //           return Column(
                            //             children: [
                            //               ModuleListItem(
                            //                 module: _project.listOfModules[mark],
                            //                 removeModule: (value) {
                            //                   setState(() {
                            //                     removeModule(mark);
                            //                   });
                            //                 },
                            //                 addTask: (Module value) {
                            //                   //on tap should create a new page
                            //                   //where tasks can be added and returned
                            //                   //to parent module.
                            //                   //tasks are displayed horizontally on this page.
                            //                   print(value.moduleName);
                            //                 },
                            //               ),
                            //             ],
                            //           );
                            //         }),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    : Text(''),
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
