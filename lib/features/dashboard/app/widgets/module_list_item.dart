import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';

import 'module_item.dart';

class ModuleListItem extends StatefulWidget {
  final Module module;
  final Function removeModule;
  final Function addTask;
  final Function showListOfTasks;

  const ModuleListItem({
    Key key,
    this.module,
    this.removeModule,
    this.addTask,
    this.showListOfTasks,
  }) : super(key: key);
  @override
  _ModuleListItemState createState() => _ModuleListItemState();
}

class _ModuleListItemState extends State<ModuleListItem> {
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
                  widget.module.moduleName,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 2.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.addTask(widget.module);
                  },
                  child: widget.module.listOfTasks.isEmpty
                      ? Text(
                          AppStrings.addModule,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        )
                      : null,
                ),
              ],
            ),
          ),
          SizedBox(width: 2.0),
          InkWell(
            onTap: () {
              //remove delete project
              widget.removeModule(widget.module);
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
