import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/company_custom_dialog.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_body.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer.dart';
import 'package:wowca_task/features/departments/app/page/add_dept.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DashboardPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const DashboardPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            print('App bar tapped');

            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogBox();
                });
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => CustomDialogBox(
            //               title: 'title',
            //               descriptions: 'descriptions',
            //               text: 'text',
            //             )));
          },
          child: Container(
            child: Text('Company Name'),
          ),
        ),
        elevation: 5.0,
      ),
      body: widget.dept == null
          ? AddDeptPage(user: widget.user, dept: widget.dept)
          : DashBoardBody(
              user: widget.user,
            ),
      endDrawer: DashBoardDrawer(
        user: widget.user,
        dept: widget.dept,
      ),
    );
  }
}

//if dept == null
//material page route to a create department page
