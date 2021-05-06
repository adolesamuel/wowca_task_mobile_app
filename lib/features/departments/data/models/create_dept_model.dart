import 'package:wowca_task/features/departments/domain/entity/created_dept_entity.dart';

class CreatedDeptModel extends CreatedDeptEntity {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  CreatedDeptModel({
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
  }) : super(
          departmentDescription: departmentDescription,
          departmentId: departmentId,
          departmentName: departmentName,
          listofUsers: listofUsers,
          listofProject: listofProject,
        );

  factory CreatedDeptModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return CreatedDeptModel();
    } else {
      return CreatedDeptModel(
        departmentDescription: data['description'],
        departmentId: data['_id'],
        departmentName: data['dept_title'],
        listofUsers: [],
        listofProject: [],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'departmentDescription': departmentDescription,
      'departmentId': departmentId,
      'departmentName': departmentName,
      'listofUsers': listofUsers,
      'listofProject': listofProject,
    };
  }
}
