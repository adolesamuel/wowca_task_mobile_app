import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';

class ProjectListItem extends StatefulWidget {
  final Project project;
  final Function removeProject;

  const ProjectListItem({Key key, this.project, this.removeProject})
      : super(key: key);
  @override
  _ProjectListItemState createState() => _ProjectListItemState();
}

class _ProjectListItemState extends State<ProjectListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 200.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  widget.project.projectName,
                  style: TextStyle(color: Colors.white),
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
