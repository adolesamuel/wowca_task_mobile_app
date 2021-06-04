import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/helpers.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/project/app/bloc/project_bloc.dart';
import 'package:wowca_task/features/project/app/widgets/show_project_bottom_sheet.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/injection_container.dart';

class ProjectBody extends StatefulWidget {
  @override
  _ProjectBodyState createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> {
  TextEditingController projectSearchController = TextEditingController();
  final projectBloc = sl<ProjectBloc>();

  @override
  void initState() {
    super.initState();
    projectBloc.add(GetProjectsEvent());
  }

  @override
  void dispose() {
    projectSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        TextField(
          controller: projectSearchController,
          decoration: InputDecoration(
            labelText: 'Search for Projects',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(Quantity.smallBoxPadding),
              ),
              BlocProvider(
                create: (context) => projectBloc,
                child: BlocConsumer<ProjectBloc, ProjectState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProjectLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ListOfProjectsReceivedState) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                            itemCount: state.projects.length,
                            itemBuilder: (context, index) {
                              if (state.projects.length - 1 == index) {
                                return Column(
                                  children: [
                                    ProjectContainer(
                                        project: state.projects[index]),
                                    SizedBox(
                                      height: 100.0,
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  ProjectContainer(
                                    project: state.projects[index],
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  )
                                ],
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Text('Project Loading Error'),
                      );
                    }

                    // if (listOfProject.length - 1 == index) {
                    //   return Column(
                    //     children: [
                    //       ProjectContainer(
                    //         project: listOfProject[index],
                    //       ),
                    //       SizedBox(
                    //         height: 48.0,
                    //       )
                    //     ],
                    //   );
                    // }
                    // return Column(
                    //   children: [
                    //     ProjectContainer(project: listOfProject[index]),
                    //     SizedBox(
                    //       height: 16.0,
                    //     )
                    //   ],
                    // );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectContainer extends StatefulWidget {
  final ProjectEntity project;

  const ProjectContainer({Key key, this.project}) : super(key: key);

  @override
  _ProjectContainerState createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showProjectBottomSheet(
          context: context,
        );
      },
      child: PhysicalModel(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          height: 100.0,
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                      color: Colors.yellow,
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            toCapital(sentence: widget.project.projectName),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Modules:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Text(
                          'Department: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '45%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
