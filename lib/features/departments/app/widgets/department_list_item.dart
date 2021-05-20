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
        //!push deptEntity here
        print('dept tapped');
        showDeptBottomSheet(context: context);
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 10.0,
        ),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${widget.dept.departmentName}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('No of Projects : ${widget.dept.listofProject.length}'),
              Text('No of Users : ${widget.dept.listofUsers.length}'),
            ],
          )
        ]),
      ),
    );
  }
}
