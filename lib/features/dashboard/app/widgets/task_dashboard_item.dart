import 'package:flutter/material.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

class TaskDashBoardItem extends StatelessWidget {
  final GetTaskEntity taskEntity;
  final Color color;

  const TaskDashBoardItem(
      {Key key, this.taskEntity, this.color = Colors.yellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        color: Colors.grey[300],
        height: 40.0,
        child: Row(
          children: [
            Container(
              height: 30.0,
              width: 5.0,
              color: color,
            ),
            SizedBox(
              width: 8.0,
            ),
            taskEntity != null
                ? Text('${taskEntity.taskName}')
                : Text('Task Name'),
          ],
        ),
      ),
    );
  }
}
