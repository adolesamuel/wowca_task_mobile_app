import 'package:equatable/equatable.dart';

class CreatedDeptEntity extends Equatable {
  final String supervisorId;
  final String supervisorName;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  CreatedDeptEntity({
    this.supervisorId,
    this.supervisorName,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
  });

  @override
  List<Object> get props => [
        supervisorId,
        supervisorName,
        departmentId,
        departmentName,
        listofUsers,
        listofProject,
      ];
}
