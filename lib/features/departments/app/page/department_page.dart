import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/app/page/create_dept_page.dart';
import 'package:wowca_task/features/departments/app/widgets/department_list_item.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class DepartmentPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const DepartmentPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  TextEditingController deptSearchController = TextEditingController();
  final departmentBloc = sl<DepartmentBloc>();

  @override
  void initState() {
    departmentBloc.add(GetDepartmentsEvent());
    super.initState();
  }

  @override
  void dispose() {
    deptSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.departmentText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateDepartmentPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Flex(
          direction: Axis.vertical,
          children: [
            TextField(
              controller: deptSearchController,
              decoration: InputDecoration(
                labelText: AppStrings.searchForDeptText,
                suffixIcon: Icon(Icons.search),
              ),
            ),
            BlocProvider(
              create: (context) => departmentBloc,
              child: BlocConsumer<DepartmentBloc, DepartmentState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is DepartmentLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ListOfDepartmentState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.listOfDept.length,
                        itemBuilder: (context, index) {
                          return DeptListItem(dept: state.listOfDept[index]);
                        },
                      ),
                    );
                  } else {
                    return Text('Error Loading Departments');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
