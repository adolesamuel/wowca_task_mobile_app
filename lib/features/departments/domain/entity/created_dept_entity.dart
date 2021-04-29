import 'package:equatable/equatable.dart';

class CreatedDeptEntity extends Equatable {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  CreatedDeptEntity({
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
  });

  @override
  List<Object> get props => [
        departmentDescription,
        departmentId,
        departmentName,
        listofUsers,
        listofProject,
      ];
}
