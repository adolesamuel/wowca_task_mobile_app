import 'package:equatable/equatable.dart';

class DeptEntity extends Equatable {
  // description of the dept
  final String departmentDescription;

  //department Id
  final String departmentId;

  //Department name
  final String departmentName;

  //company department is in
  final String companyId;

  //list of userId in the dept
  final List<String> listofUsers;

  //list of projectid in the dept
  final List<String> listofProject;

  DeptEntity({
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
    this.companyId,
  });

  @override
  List<Object> get props => [
        departmentDescription,
        departmentId,
        departmentName,
        listofUsers,
        listofProject,
        companyId,
      ];
}
