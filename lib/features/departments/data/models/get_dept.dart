import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

class DeptModel extends DeptEntity {
  final String supervisorId;
  final String supervisorName;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  DeptModel({
    this.supervisorId,
    this.supervisorName,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
  }) : super(
          supervisorId: supervisorId,
          supervisorName: supervisorName,
          departmentId: departmentId,
          departmentName: departmentName,
          listofUsers: listofUsers,
          listofProject: listofProject,
        );

  factory DeptModel.fromJson(Map<String, dynamic> data) {
    return DeptModel();
  }

  Map<String, dynamic> toJson() {
    return {
      'supervisorId': supervisorId,
      'supervisorName': supervisorName,
      'departmentId': departmentId,
      'departmentName': departmentName,
      'listofUsers': listofUsers,
      'listofProject': listofProject,
    };
  }
}
