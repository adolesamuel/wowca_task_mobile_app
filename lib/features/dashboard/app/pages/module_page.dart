import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';

class ModulePage extends StatefulWidget {
  final Project project;

  const ModulePage({Key key, this.project}) : super(key: key);

  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.projectName + ' project'),
      ),
      body: Center(
        child: GestureDetector(
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
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
                          Text(
                              widget.project.listOfModules[0].moduleName
                                  .toUpperCase(),
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
                            widget.project.listOfModules[0].listOfTasks
                                        .length <=
                                    1
                                ? '${widget.project.listOfModules[0].listOfTasks.length} Task'
                                : '${widget.project.listOfModules[0].listOfTasks.length} Tasks',
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
        ),
      ),
    );
  }
}
