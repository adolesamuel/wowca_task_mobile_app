import 'package:equatable/equatable.dart';

class DeptEntity extends Equatable {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final String companyId;
  final List<String> listofUsers;
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
