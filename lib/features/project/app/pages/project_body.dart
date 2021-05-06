import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';

class ProjectBody extends StatefulWidget {
  @override
  _ProjectBodyState createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> {
  List<Project> listOfProject = [
    Project(
      projectName: 'Google project',
      listOfModules: [],
    ),
    Project(projectName: 'Apple', listOfModules: []),
    Project(projectName: 'Hp', listOfModules: []),
    Project(projectName: 'Lenovo', listOfModules: []),
    Project(projectName: 'Discord', listOfModules: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: listOfProject.length,
          itemBuilder: (context, index) {
            return ProjectContainer(project: listOfProject[index]);
          }),
    );
  }
}

class ProjectContainer extends StatefulWidget {
  final Project project;

  const ProjectContainer({Key key, this.project}) : super(key: key);

  @override
  _ProjectContainerState createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.project.projectName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 110.0,
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 91,
                  color: Colors.purple,
                ),
                Container(
                  height: 95.0,
                  width: 300.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, //widget.project.listOfModules.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
