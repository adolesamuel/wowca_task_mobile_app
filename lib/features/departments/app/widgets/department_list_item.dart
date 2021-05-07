import 'package:flutter/material.dart';
import 'package:wowca_task/features/departments/app/widgets/dept_modal_bottom_sheet.dart';

class DeptListItem extends StatefulWidget {
  @override
  _DeptListItemState createState() => _DeptListItemState();
}

class _DeptListItemState extends State<DeptListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
          Text('Department Name'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('No of Projects : 6'),
              Text('No of Users : 26'),
            ],
          )
        ]),
      ),
    );
  }
}
