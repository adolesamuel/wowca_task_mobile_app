import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/project/app/bloc/project_bloc.dart';
import 'package:wowca_task/features/project/app/pages/create_project_page.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

//Useful
Future<dynamic> showProjectBottomSheet({
  @required BuildContext context,
  ProjectEntity project,
}) {
  final projectBloc = BlocProvider.of<ProjectBloc>(context);
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: project == null
                    ? Text('Project Name')
                    : Text(project.projectName),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Users',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'No of Modules:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //Update project elevated button
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateProjectPage(
                                            project: project,
                                          )));
                            },
                            child: Text('Update Project Details')),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),

                      //Delete Project elevated Button
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red.shade900)),
                          onPressed: () {
                            return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(AppStrings.confirmDeleteText),
                                      content:
                                          Text(AppStrings.sureToDeleteText),
                                      actions: [
                                        //Delete confirmation dialog button
                                        OutlinedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red.shade900),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white)),
                                            onPressed: () {
                                              projectBloc.add(
                                                  DeleteProjectEvent(
                                                      project.projectId));
                                              projectBloc
                                                  .add(GetProjectsEvent());
                                              // to close dialog
                                              Navigator.pop(context);
                                              // to close modal bottom sheet
                                              Navigator.pop(context);
                                            },
                                            child: Text(AppStrings.deleteText)),
                                      ],
                                    ));
                          },
                          child: Text('Delete Project'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
