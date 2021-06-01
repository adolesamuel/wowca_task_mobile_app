import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  final String projectId;
  final String projectName;
  final String department;
  final String description;
  final List<String> listOfModules;
  final String createdAt;
  final String updatedAt;
  final List<String> members;

  ProjectModel({
    this.projectId,
    this.projectName,
    this.department,
    this.description,
    this.listOfModules,
    this.createdAt,
    this.updatedAt,
    this.members,
  }) : super(
          department: department,
          listOfModules: listOfModules,
          projectId: projectId,
          description: description,
          projectName: projectName,
          createdAt: createdAt,
          updatedAt: updatedAt,
          members: members,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> data) {
    if (data = null)
      return ProjectModel();
    else {
      return ProjectModel(
        projectId: data['_id'],
        projectName: data['project_title'],
        department: data['department'],
        listOfModules: data['modules'],
        description: data['project_desc'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
        members: data['members'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': projectId,
      'project_title': projectName,
      'department': department,
      'modules': listOfModules,
      'project_desc': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'members': members,
    };
  }
}
