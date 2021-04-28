import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/features/user_registration/app/bloc/signup_bloc.dart';
import 'package:wowca_task/injection_container.dart';
import 'package:wowca_task/task_app.dart';

class DashBoardDrawer extends StatefulWidget {
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
              'Drawer Header',
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
            },
          ),
          ListTile(
            title: Text('Department'),
            onTap: () {
              print('Drawer Department button pressed');
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
              ListTile(
                title: Text('Users'),
                onTap: () {
                  print('Drawer User button pressed');
                },
              ),
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
