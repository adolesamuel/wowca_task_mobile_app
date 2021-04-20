import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/dashboard/app/pages/add_task_page.dart';

class DashboardPage extends StatefulWidget {
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
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Quantity.mediumBorderRadius),
                      bottomRight: Radius.circular(Quantity.mediumBorderRadius),
                    )),
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    //Those two pink boxes up there
                    //one is meant for profile image
                    //and the other is meant for the user info, say name,
                    //organisation
                    //department, role in company etc.
                    //projects and total number of modules,
                    //modules contain detail of projects they're connected to
                    //switch between module and project view
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Quantity.smallBorderRadius))),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 100.0,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Quantity.smallBorderRadius))),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: 7,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      width: 200.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Quantity.smallBorderRadius))),
                      child: Center(child: Text('Module: $index')),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: '/AddTaskPage'),
                  builder: (context) {
                    return AddTaskPage();
                  }));
        },
      ),
    );
  }
}
