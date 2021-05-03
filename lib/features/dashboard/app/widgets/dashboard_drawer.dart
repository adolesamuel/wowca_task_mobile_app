import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/features/dashboard/app/pages/dashboard_page.dart';
import 'package:wowca_task/features/departments/app/page/department_page.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/task/app/pages/task_page.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';
import 'package:wowca_task/task_app.dart';

class DashBoardDrawer extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const DashBoardDrawer({
    Key key,
    @required this.user,
    @required this.dept,
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
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              'Drawer Header: ${widget.user.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              print('Drawer Home button pressed');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardPage(
                            dept: widget.dept,
                            user: widget.user,
                          )));
            },
          ),
          ListTile(
            title: Text('Tasks'),
            onTap: () {
              print('Drawer Home button pressed');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskPage(
                            user: widget.user,
                            dept: widget.dept,
                          )));
            },
          ),
          ListTile(
            title: Text('Departments'),
            onTap: () {
              print('Drawer Department button pressed');
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
          ListTile(
            title: Text('Users'),
            onTap: () {
              print('Drawer User button pressed');
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
                        print('Drawer Sign out button pressed');
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
