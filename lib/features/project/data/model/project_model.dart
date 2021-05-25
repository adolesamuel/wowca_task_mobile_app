import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  final String projectId;
  final String projectName;
  final String department;
  final String description;
  final List<String> listOfModules;

  ProjectModel({
    this.projectId,
    this.projectName,
    this.department,
    this.description,
    this.listOfModules,
  }) : super(
          department: department,
          listOfModules: listOfModules,
          projectId: projectId,
          description: description,
          projectName: projectName,
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
    };
  }
}
