import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/quantities.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/core/utils/style.dart';
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/injection_container.dart';

class CreateDepartmentPage extends StatefulWidget {
  final DeptEntity dept;

  const CreateDepartmentPage({Key key, this.dept}) : super(key: key);

  @override
  _CreateDepartmentPageState createState() => _CreateDepartmentPageState();
}

class _CreateDepartmentPageState extends State<CreateDepartmentPage> {
  final _departmentBloc = sl<DepartmentBloc>();
  TextEditingController _deptNameTextController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  List deptUsers = [];
  List deptProjects = [];

  DeptEntity dept;

  bool _isButtonDisabled = false;
  bool _validateError = false;

  @override
  void initState() {
    super.initState();
    if (widget.dept != null) {
      _deptNameTextController.text = widget.dept.departmentName;
      _descriptionController.text = widget.dept.departmentDescription;
    } else {
      _deptNameTextController.text = '';
      _descriptionController.text = '';
    }
  }

  @override
  void dispose() {
    _deptNameTextController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool validateTextFields() {
    return _deptNameTextController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.dept == null
              ? Text(AppStrings.createDepartmentText)
              : Text(AppStrings.updateDepartmentText),
        ),
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

                //create a department text
                Text(
                  widget.dept == null
                      ? AppStrings.createADepartmentText
                      : AppStrings.updateDepartmentText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),

                //Departmentent Name Text
                Text(
                  AppStrings.departmentNameText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                //Department Text Field
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    onChanged: (value) => setState(() {
                      _validateError = false;
                    }),
                    controller: _deptNameTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorText: _validateError
                            ? AppStrings.validatorNameText
                            : null,
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
                //Description Text
                Text(
                  AppStrings.descriptionText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                //Description Text Field
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    onChanged: (value) => setState(() {
                      _validateError = false;
                    }),
                    controller: _descriptionController,
                    maxLines: null,
                    minLines: 3,
                    decoration: InputDecoration(
                      errorText: _validateError
                          ? AppStrings.validatorEnterDescriptionText
                          : null,
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
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Quantity.mediumSpace,
                ),
                //Disabled Awaiting API support
                // OutlinedButton(
                //   onPressed: () {},
                //   child: Text(AppStrings.addUsersText),
                // ),
                // SizedBox(
                //   height: Quantity.mediumSpace,
                // ),
                // Text(
                //   AppStrings.usersText,
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: Quantity.mediumSpace,
                // ),
                // OutlinedButton(
                //   onPressed: () {},
                //   child: Text(AppStrings.addExistingProjectsText),
                // ),
                // SizedBox(
                //   height: Quantity.mediumSpace,
                // ),
                // Text(
                //   AppStrings.projectText,
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  height: Quantity.largeSpace,
                ),
                BlocProvider(
                  create: (context) => _departmentBloc,
                  child: BlocConsumer<DepartmentBloc, DepartmentState>(
                    listener: (context, state) {
                      if (state is DepartmentErrorState) {
                        setState(() {
                          _isButtonDisabled = false;
                        });
                      }
                      if (state is CreatedDepartmentState) {
                        // wait 2 seconds for Company creation success
                        // to show on U.i then pop it

                        Future.delayed(
                            Quantity.twoSecond, () => Navigator.pop(context));
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(
                                        Quantity.buttonElevation)),
                                onPressed: _isButtonDisabled
                                    ? null
                                    : () {
                                        if (validateTextFields()) {
                                          setState(() {
                                            _validateError = false;
                                            _isButtonDisabled = false;
                                          });
                                          if (widget.dept == null) {
                                            print('Create Dept Event');
                                            _departmentBloc
                                                .add(CreateDepartmentEvent(
                                              deptName:
                                                  _deptNameTextController.text,
                                              deptDescription:
                                                  _descriptionController.text,
                                            ));
                                          }
                                          //update department
                                          else {
                                            print(
                                                'call update department event here');
                                          }
                                        } else {
                                          setState(() {
                                            _validateError = true;
                                          });
                                        }
                                      },
                                child: Text(widget.dept == null
                                    ? AppStrings.createDepartmentText
                                    : AppStrings.updateCompanyText),
                              ),
                            ),
                            SizedBox(
                              height: Quantity.mediumSpace,
                            ),
                            state is DepartmentLoadingState
                                ? LinearProgressIndicator()
                                : state is CreatedDepartmentState
                                    ? Text(
                                        AppStrings.companyCreatedText,
                                        style:
                                            AppStyles.registrationPageTextStyle,
                                      )
                                    : state is DepartmentErrorState
                                        ? Text(
                                            state.failure.message,
                                            style: AppStyles
                                                .registrationPageTextStyle,
                                          )
                                        : Text(''),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
