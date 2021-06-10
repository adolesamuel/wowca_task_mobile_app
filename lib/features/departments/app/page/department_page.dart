import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wowca_task/core/helpers/search_widget.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/app/bloc/department_bloc.dart';
import 'package:wowca_task/features/departments/app/page/create_dept_page.dart';
import 'package:wowca_task/features/departments/app/widgets/department_list_item.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/injection_container.dart';

class DepartmentPage extends StatefulWidget {
  final SignedInUserEntity user;

  const DepartmentPage({Key key, this.user}) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final departmentBloc = sl<DepartmentBloc>();
  List<DeptEntity> deptList;

  String query = '';

  @override
  void initState() {
    super.initState();
    departmentBloc.add(GetDepartmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.departmentText),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateDepartmentPage()))
              .then((value) => departmentBloc.add(GetDepartmentsEvent()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            _buildSearch(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(AppStrings.departmentText,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BlocProvider(
                      create: (context) => departmentBloc,
                      child: BlocBuilder<DepartmentBloc, DepartmentState>(
                        buildWhen: (previousState, currentState) {
                          return previousState != currentState;
                        },
                        builder: (context, state) {
                          if (state is DepartmentLoadingState) {
                            if (deptList == null || deptList.isEmpty) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: ListView.builder(
                                      itemCount: deptList.length,
                                      itemBuilder: (context, index) {
                                        return DeptListItem(
                                          dept: deptList[index],
                                        );
                                      }));
                            }
                          }
                          if (state is ListOfDepartmentState) {
                            if (query.isEmpty) {
                              deptList = state.listOfDept;

                              if (deptList.isNotEmpty) {
                                return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: ListView.builder(
                                        itemCount: deptList.length,
                                        itemBuilder: (context, index) {
                                          return DeptListItem(
                                            dept: deptList[index],
                                          );
                                        }));
                              } else {
                                return Center(
                                    child: Text(AppStrings.emptyItemText));
                              }
                            } else {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                    itemCount: deptList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          child: ListView.builder(
                                              itemCount: deptList.length,
                                              itemBuilder: (context, index) {
                                                return DeptListItem(
                                                  dept: deptList[index],
                                                );
                                              }));
                                    }),
                              );
                            }
                          } else {
                            return Center(
                                child: Text('Error Loading Departments'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search with Department Name',
        onChanged: _searchItems,
      );

  void _searchItems(String query) {
    final deptListThings = deptList.where((dept) {
      final name = dept.departmentName.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.deptList = deptListThings;
    });
  }
}
