import 'package:flutter/material.dart';
import 'package:wowca_task/features/departments/app/widgets/dept_modal_bottom_sheet.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

class DeptListItem extends StatefulWidget {
  final DeptEntity dept;

  const DeptListItem({Key key, this.dept}) : super(key: key);
  @override
  _DeptListItemState createState() => _DeptListItemState();
}

class _DeptListItemState extends State<DeptListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDeptBottomSheet(
          context: context,
          dept: widget.dept,
        );
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 10.0,
        ),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.yellow[900],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dept.departmentName == null
                ? 'Department Name'
                : '${widget.dept.departmentName}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.dept.listofProject.isEmpty
                    ? 'No of Projects : 0'
                    : 'No of Projects : ${widget.dept.listofProject.length}'),
                Text(widget.dept.listofUsers.isEmpty
                    ? 'No of Users : 0'
                    : 'No of Users : ${widget.dept.listofUsers.length}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
