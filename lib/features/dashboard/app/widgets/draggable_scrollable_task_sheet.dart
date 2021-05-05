import 'package:flutter/material.dart';

//Testing to be deleted
//Delete this later on
class TaskScrollableSheet extends StatefulWidget {
  @override
  _TaskScrollableSheetState createState() => _TaskScrollableSheetState();
}

class _TaskScrollableSheetState extends State<TaskScrollableSheet> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (
        context,
        scrollcontroller,
      ) {
        return Container(
          color: Colors.blue,
        );
      },
    );
  }
}
