import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/pages/add_task_page.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DashboardPage extends StatefulWidget {
  final SignedInUserEntity user;

  const DashboardPage({Key key, this.user}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.dashboardTitle),
        elevation: 5.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: 75.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Quantity.smallBorderRadius))),
                child: Column(
                  children: [
                    Text(widget.user.name),
                    Text(widget.user.email),
                    Text(widget.user.orgName),
                    Text(widget.user.role),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AddTaskPage(),
            )
          ],
        ),
      ),
      drawer: DashBoardDrawer(),
    );
  }
}
