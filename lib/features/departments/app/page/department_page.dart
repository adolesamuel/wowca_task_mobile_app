import 'package:flutter/material.dart';
import 'package:wowca_task/features/dashboard/app/widgets/dashboard_drawer.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DepartmentPage extends StatefulWidget {
  final SignedInUserEntity user;

  const DepartmentPage({Key key, this.user}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashBoardDrawer(
        user: widget.user,
      ),
      appBar: AppBar(
        title: Text('Departments'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0)),
                height: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Department Name'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('list of Projects'),
                        Text('list of users'),
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
