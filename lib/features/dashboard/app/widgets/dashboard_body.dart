import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_item_box.dart';
import 'package:wowca_task/features/dashboard/app/widgets/grid_widget.dart';
import 'package:wowca_task/features/dashboard/app/widgets/task_dashboard_item.dart';
import 'package:wowca_task/features/departments/app/page/department_page.dart';
import 'package:wowca_task/features/module/app/pages/module_page.dart';
import 'package:wowca_task/features/project/app/pages/project_page.dart';
import 'package:wowca_task/features/task/app/pages/task_page.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

//Useful
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskPage()));
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
        GridForDashBoard(gap: 10.0, padding: EdgeInsets.all(10.0), children: [
          DashboardBox(
            number: 5,
            boxName: 'Department',
            color: Colors.yellow,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DepartmentPage())),
          ),
          DashboardBox(
            number: 15,
            boxName: 'Project',
            color: Colors.blue,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProjectPage())),
          ),
          DashboardBox(
            number: 29,
            boxName: 'Modules',
            color: Colors.green,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ModulePage())),
          ),
          DashboardBox(
            number: 112,
            boxName: 'Tasks',
            color: Colors.blueGrey,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => TaskPage())),
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
        GridForDashBoard(gap: 10.0, padding: EdgeInsets.all(10.0), children: [
          DashboardBox(
            number: 5,
            boxName: 'Department',
            color: Colors.yellow,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DepartmentPage())),
          ),
          DashboardBox(
            number: 15,
            boxName: 'Project',
            color: Colors.blue,
          ),
          DashboardBox(
            number: 29,
            boxName: 'Modules',
            color: Colors.green,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ModulePage())),
          ),
          DashboardBox(
            number: 112,
            boxName: 'Tasks',
            color: Colors.blueGrey,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => TaskPage())),
          ),
        ]),
      ],
    );
  }
}
