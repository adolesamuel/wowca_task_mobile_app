import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

class DeptModel extends DeptEntity {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final String companyId;
  final List<String> listofUsers;
  final List<String> listofProject;
  final String createdAt;
  final String updatedAt;

  DeptModel({
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.companyId,
    this.listofUsers,
    this.listofProject,
    this.createdAt,
    this.updatedAt,
  }) : super(
          companyId: companyId,
          departmentDescription: departmentDescription,
          departmentId: departmentId,
          departmentName: departmentName,
          listofUsers: listofUsers,
          listofProject: listofProject,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory DeptModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return DeptModel();
    } else {
      return DeptModel(
        departmentDescription: data['description'] ?? null,
        departmentId: data['_id'] ?? null,
        departmentName: data['dept_title'] ?? null,
        listofUsers: List<String>.from(data['members'].map((x) => x)),
        listofProject: List<String>.from(data['projects'].map((x) => x)),
        companyId: data['company'] ?? null,
        createdAt: data["createdAt"] ?? null,
        updatedAt: data["updatedAt"] ?? null,
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
      'company': companyId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
