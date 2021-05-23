import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/features/company/app/pages/company_page.dart';
import 'package:wowca_task/features/departments/app/page/department_page.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';

//Useful
Future<dynamic> showUserBottomSheet({
  @required BuildContext context,
  UserEntity user,
}) {
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: user == null ? Text('User Name') : Text(user.userName),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: ' + user.userEmail,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Active Tasks: ' + user.userTasks.length.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Divider(
                        thickness: 2.0,
                      ),

                      Text(
                        'Companies User works for:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompanyPage()));
                            },
                            child: Text('Add to Company')),
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Most Recent Department: ' + user.userDepartment,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //Update task elevated button
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DepartmentPage()));
                            },
                            child: Text('Add to Department')),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Divider(
                        thickness: 2.0,
                      ),

                      //you'll probably need to inclued a message user button eventually
                    ],
                  ),
                ),
              ),
            ),
          ));
}
