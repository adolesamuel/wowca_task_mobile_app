import 'package:flutter/material.dart';
import 'package:wowca_task/features/task/app/pages/create_task.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

class TaskListItem extends StatefulWidget {
  final TaskEntity task;

  const TaskListItem({
    Key key,
    this.task,
  }) : super(key: key);
  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  TaskEntity task = TaskEntity(
    taskName: 'Text Task 1',
    started: true,
    completed: true,
    taskDescription:
        'creating an egg is not a days job The quick brown fox jumped over the lazy dog , the quick brown fox jumped over the lazy dog',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ExpansionTile(
          backgroundColor: taskColor(task),
          collapsedBackgroundColor: taskColor(task),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${task.taskName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateTaskPage(
                            task: task,
                          ),
                        ));
                  })
            ],
          ),
          children: [
            SizedBox(
              height: 2.0,
            ),
            Card(
              elevation: 0,
              color: taskColor(task),

              //show length of attachments.
              //show description of items as subtitle,
              //view attachments as a list
              child: Text('${task.taskDescription}'),
            ),
          ],
        ),
      ),
    );
  }
}

Color taskColor(task) {
  return task.completed
      ? Colors.blue
      : task.started
          ? Colors.green
          : Colors.yellow;
}
