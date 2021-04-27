import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';

class ProjectListItem extends StatefulWidget {
  final Project project;
  final Function removeProject;
  final Function addModule;

  const ProjectListItem(
      {Key key, this.project, this.removeProject, this.addModule})
      : super(key: key);
  @override
  _ProjectListItemState createState() => _ProjectListItemState();
}

class _ProjectListItemState extends State<ProjectListItem> {
  @override
  Widget build(BuildContext context) {
    //TODO: add a colour gradient to the container
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 250.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius:
            BorderRadius.all(Radius.circular(Quantity.inputBorderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  widget.project.projectName,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 2.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.addModule(widget.project);
                  },
                  child: widget.project.listOfModules.isEmpty
                      ? Text(
                          AppStrings.addModule,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        )
                      : Text(
                          AppStrings.addModule,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.0),
          InkWell(
            onTap: () {
              //remove delete project
              widget.removeProject(widget.project);
            },
            child: Container(
              color: Colors.red,
              width: Quantity.addButtonSquareSide,
              height: Quantity.addButtonSquareSide,
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 2.0),
        ],
      ),
    );
  }
}
