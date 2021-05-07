import 'package:flutter/material.dart';
import 'package:wowca_task/core/helpers/capitalize_first_letter.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

class ProjectBody extends StatefulWidget {
  @override
  _ProjectBodyState createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> {
  TextEditingController projectSearchController = TextEditingController();

  List<ProjectEntity> listOfProject = [
    ProjectEntity(
      projectName: 'Google project',
      listOfModules: [],
    ),
    ProjectEntity(projectName: 'Apple', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
    ProjectEntity(projectName: 'Hp', listOfModules: []),
  ];

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
          child: ListView.builder(
              itemCount: listOfProject.length,
              itemBuilder: (context, index) {
                return ProjectContainer(project: listOfProject[index]);
              }),
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
  //custom method to capitalize first letter of each word.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5.0,
        child: Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                  color: Colors.yellow,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(toCapital(sentence: widget.project.projectName),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Empty',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
              Container(
                //use glow avatar with changing levels from red to orange to yellow
                // to yellowish green to green and then blue.
                // based on percentage completion from database.

                width: 100.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
