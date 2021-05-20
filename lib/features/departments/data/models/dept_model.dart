import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

class DeptModel extends DeptEntity {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;

  DeptModel({
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

  factory DeptModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return DeptModel();
    } else {
      return DeptModel(
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
