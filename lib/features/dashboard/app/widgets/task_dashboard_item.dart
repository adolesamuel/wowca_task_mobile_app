import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/widgets/task_modal_bottom_sheet.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

//useful
class TaskDashBoardItem extends StatefulWidget {
  final TaskEntity taskEntity;
  final Color color;

  const TaskDashBoardItem(
      {Key key, this.taskEntity, this.color = Colors.yellow})
      : super(key: key);

  @override
  _TaskDashBoardItemState createState() => _TaskDashBoardItemState();
}

class _TaskDashBoardItemState extends State<TaskDashBoardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTaskBottomSheetMenu(
          context: context,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Quantity.minuteBorderRadius),
            color: Colors.grey[300],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 4.0,
          ),
          height: 40.0,
          child: Row(
            children: [
              Container(
                height: 30.0,
                width: 5.0,
                color: widget.color,
              ),
              SizedBox(
                width: 8.0,
              ),
              widget.taskEntity != null
                  ? Text('${widget.taskEntity.taskName}')
                  : Text('Task Name'),
            ],
          ),
        ),
      ),
    );
  }
}
