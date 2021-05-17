import 'package:flutter/material.dart';
import 'package:wowca_task/features/departments/app/page/create_dept_page.dart';
import 'package:wowca_task/features/departments/app/widgets/department_list_item.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class DepartmentPage extends StatefulWidget {
  final SignedInUserEntity user;
  final DeptEntity dept;

  const DepartmentPage({Key key, this.user, this.dept}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  TextEditingController deptSearchController = TextEditingController();

  @override
  void dispose() {
    deptSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
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
                labelText: 'Search for departments',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return DeptListItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
