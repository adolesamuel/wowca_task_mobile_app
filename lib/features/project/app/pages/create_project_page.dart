import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/project/app/bloc/project_bloc.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/injection_container.dart';

class CreateProjectPage extends StatefulWidget {
  final ProjectEntity project;

  const CreateProjectPage({Key key, this.project}) : super(key: key);
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final projectBloc = sl<ProjectBloc>();
  TextEditingController projectNameTextController = TextEditingController();
  TextEditingController projectDescTextController = TextEditingController();
  bool validate = false;
  bool isButtonDisabled;

  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
    widget.project?.projectName != null
        ? projectNameTextController.text = widget.project.projectName
        : projectNameTextController.text = null;
    widget.project?.description != null
        ? projectDescTextController.text = widget.project.description
        : projectDescTextController.text = null;
  }

  @override
  void dispose() {
    projectNameTextController.dispose();
    projectDescTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.createProjectString),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                Text(
                  AppStrings.createAProjectString,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),

                //Project Name TextField

                Text(
                  AppStrings.projectNameString,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: projectNameTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText:
                            validate ? AppStrings.validatorNameText : null,
                        errorStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.5,
                            ))),
                  ),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),

                //Project Description TextField

                Text(
                  AppStrings.descriptionText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: projectDescTextController,
                    //expands: true,
                    maxLines: null,
                    minLines: 3,
                    decoration: InputDecoration(
                        errorText: validate
                            ? AppStrings.validatorEnterDescriptionText
                            : null,
                        errorStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.5,
                            ))),
                  ),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),

                //Add Modules Button

                OutlinedButton(
                  onPressed: () {},
                  child: Text(AppStrings.addExistingModuleString),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                Text(
                  AppStrings.modulesString + ': Empty',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Quantity.largeSpace,
                ),
                BlocProvider(
                  create: (context) => projectBloc,
                  child: BlocConsumer<ProjectBloc, ProjectState>(
                    listener: (context, state) {
                      if (state is CreatedProjectState) {
                        //wait 2 seconds for  module creation success to show on U.i then pop it
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
                        });
                      } else if (state is ErrorProjectState) {
                        setState(() {
                          isButtonDisabled = false;
                        });
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(20.0),
                                ),
                                onPressed: isButtonDisabled
                                    ? null
                                    : () {
                                        if (projectNameTextController
                                                .text.isNotEmpty &
                                            projectDescTextController
                                                .text.isNotEmpty) {
                                          validate = false;
                                          setState(() {
                                            isButtonDisabled = true;
                                          });
                                          if (widget.project == null) {
                                            projectBloc.add(
                                              CreateProjectEvent(
                                                projectName:
                                                    projectNameTextController
                                                        .text,
                                                projectDescription:
                                                    projectDescTextController
                                                        .text,
                                              ),
                                            );
                                          }
                                        } else {
                                          setState(() {
                                            validate = true;
                                          });
                                        }
                                      },
                                child: Text(AppStrings.createProjectString),
                              )),
                          SizedBox(height: Quantity.mediumSpace),
                          // returns text with error or Task Updated or Task Created Message
                          state is ProjectLoadingState
                              ? LinearProgressIndicator()
                              : state is ErrorProjectState
                                  ? Text(
                                      state.failure.title,
                                      style:
                                          AppStyles.registrationPageTextStyle,
                                    )
                                  : state is CreatedProjectState
                                      ? Text(
                                          AppStrings.projectCreated,
                                          style: AppStyles
                                              .registrationPageTextStyle,
                                        )
                                      : Text(''),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
