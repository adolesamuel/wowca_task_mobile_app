import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/widgets/company_custom_dialog.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_body.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer.dart';
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
        title: InkWell(
          onTap: () {
            print('App bar tapped');

            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogBox();
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.all(Quantity.smallBoxPadding),
            child: Row(
              children: [
                Text('Company Name'),
                SizedBox(
                  width: Quantity.smallBoxPadding,
                ),
                Icon(Icons.swap_horizontal_circle),
              ],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: DashBoardBody(
        user: widget.user,
      ),
      endDrawer: DashBoardDrawer(
        user: widget.user,
        dept: widget.dept,
      ),
    );
  }
}
