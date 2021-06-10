import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/app/page/create_dept_page.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

//Useful
Future<dynamic> showDeptBottomSheet({
  @required BuildContext context,
  DeptEntity dept,
}) {
  final departmentBloc = BlocProvider.of<DepartmentBloc>(context);
  print('Department: ${dept.departmentId}');
  return showBarModalBottomSheet(
      elevation: 5.0,
      expand: true,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Scaffold(
              appBar: AppBar(
                title: dept == null
                    ? Text(AppStrings.departmentNameText)
                    : Text(dept.departmentName),
              ),
              body: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      //Selectable widget to show the task description
                      SelectableText(dept?.departmentDescription == null
                          ? 'No Department description'
                          : dept.departmentDescription),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Projects',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Users',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        'Status',
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
                                      builder: (context) =>
                                          CreateDepartmentPage(
                                            dept: dept,
                                          )));
                            },
                            child: Text('Update Department Details')),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
