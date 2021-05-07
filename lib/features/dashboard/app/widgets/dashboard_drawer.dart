import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/features/company/app/pages/company_page.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/dashboard/app/pages/dashboard_page.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer_head.dart';
import 'package:wowca_task/features/departments/app/page/department_page.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/project/app/pages/project_page.dart';
import 'package:wowca_task/features/task/app/pages/task_page.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';
import 'package:wowca_task/task_app.dart';

//useful
class DashBoardDrawer extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;
  final CompanyEntity company;

  const DashBoardDrawer({
    Key key,
    @required this.user,
    @required this.dept,
    this.company,
  }) : super(key: key);

  @override
  _DashBoardDrawerState createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {
  final signOutBloc = sl<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //Header
          DrawerHeader(
            child: DrawerHead(user: widget.user),
          ),
          Divider(
            thickness: 1.0,
          ),

          // Home Item

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardPage(
                            dept: widget.dept,
                            user: widget.user,
                          )));
            },
          ),

          // Company Item
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Company'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyPage(
                            company: widget.company,
                            dept: widget.dept,
                            user: widget.user,
                          )));
            },
          ),

          // Department Item
          ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text('Departments'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DepartmentPage(
                      dept: widget.dept,
                      user: widget.user,
                    ),
                  ));
            },
          ),

          //Project item
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectPage(),
                  ));
            },
          ),

          //Module Item
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Modules'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectPage(),
                  ));
            },
          ),

          /// Task Item

          ListTile(
            leading: Icon(Icons.notes),
            title: Text('To Do'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskPage(
                            user: widget.user,
                            dept: widget.dept,
                          )));
            },
          ),

          ListTile(
            leading: Icon(Icons.people),
            title: Text('Users'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            thickness: 2.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocProvider<SignUpBloc>(
                create: (context) => signOutBloc,
                child: BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignedOutState) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => TaskApp()));
                    }
                  },
                  builder: (context, state) {
                    return ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Sign Out'),
                      onTap: () {
                        signOutBloc.add(SignOutEvent());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
