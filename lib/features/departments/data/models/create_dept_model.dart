import 'package:wowca_task/features/departments/domain/entity/created_dept_entity.dart';

class CreatedDeptModel extends CreatedDeptEntity {
  final String supervisorId;
  final String supervisorName;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  CreatedDeptModel({
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

  factory CreatedDeptModel.fromJson(Map<String, dynamic> data) {
    return CreatedDeptModel();
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
