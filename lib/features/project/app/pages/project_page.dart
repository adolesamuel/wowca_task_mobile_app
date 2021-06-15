import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/search_widget.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/project/app/bloc/project_bloc.dart';
import 'package:wowca_task/features/project/app/pages/create_project_page.dart';
import 'package:wowca_task/features/project/app/pages/project_container.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class ProjectPage extends StatefulWidget {
  final SignedInUserEntity user;

  const ProjectPage({Key key, @required this.user}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final projectBloc = sl<ProjectBloc>();
  List<ProjectEntity> projectList;

  String query = '';

  @override
  void initState() {
    super.initState();
    projectBloc.add(GetProjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.projectText),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateProjectPage()))
                .then((value) => projectBloc.add(GetProjectsEvent()));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: Flex(
            direction: Axis.vertical,
            children: [
              _buildSearch(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(AppStrings.projectText,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      BlocProvider(
                        create: (context) => projectBloc,
                        child: BlocBuilder<ProjectBloc, ProjectState>(
                          buildWhen: (previousState, currentState) {
                            return previousState != currentState;
                          },
                          builder: (context, state) {
                            if (state is ProjectLoadingState) {
                              if (projectList == null || projectList.isEmpty) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: ListView.builder(
                                      itemCount: projectList.length,
                                      itemBuilder: (context, index) {
                                        return ProjectContainer(
                                          project: projectList[index],
                                        );
                                      },
                                    ));
                              }
                            }
                            if (state is ListOfProjectsReceivedState) {
                              if (query.isEmpty) {
                                projectList = state.projects;

                                if (projectList.isNotEmpty) {
                                  return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: ListView.builder(
                                          itemCount: projectList.length,
                                          itemBuilder: (context, index) {
                                            return ProjectContainer(
                                              project: projectList[index],
                                            );
                                          }));
                                } else {
                                  return Center(
                                    child: Text(AppStrings.emptyItemText),
                                  );
                                }
                              } else {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: ListView.builder(
                                      itemCount: projectList.length,
                                      itemBuilder: (context, index) {
                                        return ProjectContainer(
                                          project: projectList[index],
                                        );
                                      }),
                                );
                              }
                            } else {
                              return Center(
                                  child: Text('Error Loading Projects'));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with Project Name',
        onChanged: _searchItems,
      );

  void _searchItems(String query) {
    final projectListThings = projectList.where((project) {
      final name = project.projectName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.projectList = projectListThings;
    });
  }
}
