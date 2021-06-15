import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:wowca_task/core/helpers/helpers.dart';
import 'package:wowca_task/features/project/app/widgets/show_project_bottom_sheet.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

class ProjectContainer extends StatefulWidget {
  final ProjectEntity project;

  const ProjectContainer({Key key, @required this.project}) : super(key: key);

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
          project: widget.project,
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
                          'Modules:' + '${widget.project.listOfModules.length}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Text('Date Created: ${widget.project.createdAt}'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: AvatarGlow(
                          glowColor: Colors.green,
                          endRadius: 50.0,
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                          ),
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
