import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/widgets/grid_widget.dart';
import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/task_dashboard_item.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DashBoardBody extends StatefulWidget {
  final SignedInUserEntity user;

  const DashBoardBody({Key key, this.user}) : super(key: key);
  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //First Item on Profile page
        Row(
          children: [
            //Greeetings with Flutter_Greeting package
            Container(
              padding: EdgeInsets.all(Quantity.smallSpace),
              height: 50.0,
              child: Text(
                YonoGreetings.showGreetings() + ',  ${widget.user.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
        //Tasks to do here.
        Divider(
          thickness: 1.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Quantity.smallSpace),
              child: Text(
                'To Do',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TaskDashBoardItem(),
            TaskDashBoardItem(color: Colors.blue),
            TaskDashBoardItem(color: Colors.green),
            TextButton(
                onPressed: () {
                  print('See more');
                },
                child: Text('See more...'))
          ],
        ),
        Divider(
          thickness: 1.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Quantity.smallSpace),
          child: Text(
            'ONGOING',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BasicGrid(gap: 10.0, padding: EdgeInsets.all(10.0), children: [
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ]),
        Divider(
          thickness: 1.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Quantity.smallSpace),
          child: Text(
            'COMPLETED',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BasicGrid(gap: 10.0, padding: EdgeInsets.all(10.0), children: [
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ]),
      ],
    );
  }
}
