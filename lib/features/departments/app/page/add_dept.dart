import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/features/dashboard/app/pages/dashboard_page.dart';
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class AddDeptPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const AddDeptPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _AddDeptPageState createState() => _AddDeptPageState();
}

class _AddDeptPageState extends State<AddDeptPage> {
  TextEditingController deptNameTextController;
  TextEditingController descriptionController;

  DeptEntity dept;

  final deptBloc = sl<DepartmentBloc>();

  bool validate = false;

  @override
  void initState() {
    deptNameTextController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    deptNameTextController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool validateTextFields() {
    return deptNameTextController.text.isEmpty &&
        descriptionController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Quantity.mediumSpace,
            ),
            Text(
              'Hello Admin, create a department to proceed to dashboard ',
              style: TextStyle(),
            ),
            SizedBox(
              height: Quantity.mediumSpace,
            ),
            Text(
              'Department Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: deptNameTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    errorText: validate ? 'Enter a name' : null,
                    errorStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 0.5,
                        ))),
              ),
            ),
            SizedBox(
              height: Quantity.mediumSpace,
            ),
            Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                minLines: 3,
                decoration: InputDecoration(
                    errorText: validate ? 'Enter a Description' : null,
                    errorStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 0.5,
                        ))),
              ),
            ),
            SizedBox(
              height: Quantity.largeSpace,
            ),
            BlocProvider(
              create: (context) => deptBloc,
              child: BlocConsumer<DepartmentBloc, DepartmentState>(
                listener: (context, state) {
                  if (state is DepartmentErrorState) {
                    setState(() {});
                  }
                  if (state is CreatedDepartmentState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage(
                                  user: widget.user,
                                  dept: DeptEntity().from(state.dept),
                                )));
                  }
                },
                builder: (context, state) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(20.0),
                            ),
                            onPressed: () {
                              if (validateTextFields()) {
                                setState(() {
                                  validate = validateTextFields();
                                });
                              } else {
                                deptBloc.add(CreateDepartmentEvent(
                                  deptName: deptNameTextController.text,
                                  deptDescription: descriptionController.text,
                                ));
                              }
                            },
                            child: Text('Create Department'),
                          ),
                          if (state is DepartmentLoadingState)
                            LinearProgressIndicator(),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
