import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

//Useful
Future<dynamic> showTaskBottomSheetMenu({
  @required BuildContext context,
  GetTaskEntity task,
  bool isTaskStarted = true,
  bool isTaskCompleted = false,
}) {
  //ToDo Make this page respond to tasks present
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: Text('TaskName'),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),

                      //Selectable widget to show the task description
                      SelectableText(
                          'this is a really long text that cannot be stopped but it will be stopped' +
                              'fine and it has to continue' +
                              'to infinity and beyond the scope of this ' +
                              'worlds desire, we would always love to make the world ' +
                              'a better place'),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'View Attachments',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),

                      //ListView Builder to show attachments
                      //include working download button to download attachments
                      Container(
                        height: 100.0,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Text('Item $index');
                          },
                        ),
                      ),

                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('Started'),
                          Checkbox(
                              activeColor: Colors.green,
                              value: isTaskStarted,
                              onChanged: (value) {
                                isTaskStarted = value;
                                setModalState(() {});
                              }),
                          Text('Completed'),
                          Checkbox(
                              activeColor: Colors.blue,
                              value: isTaskCompleted,
                              onChanged: (value) {
                                isTaskCompleted = value;
                                setModalState(() {});
                              }),
                        ],
                      ),
                      //Update task elevated button
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Update Task')),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
