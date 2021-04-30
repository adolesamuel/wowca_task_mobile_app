import 'package:equatable/equatable.dart';
import 'package:wowca_task/features/departments/domain/entity/created_dept_entity.dart';

class DeptEntity extends Equatable {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  DeptEntity({
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
  });

  DeptEntity from(CreatedDeptEntity dept) {
    return DeptEntity(
      departmentName: dept.departmentName,
      departmentId: dept.departmentId,
      departmentDescription: dept.departmentDescription,
      listofUsers: dept.listofUsers,
      listofProject: dept.listofProject,
    );
  }

  @override
  List<Object> get props => [
        departmentDescription,
        departmentId,
        departmentName,
        listofUsers,
        listofProject,
      ];
}
