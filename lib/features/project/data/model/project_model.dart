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
    if (data == null) {
      return ProjectModel();
    } else {
      print('project model conversion');
      return ProjectModel(
        projectId: data["_id"] ?? null,
        projectName: data["project_title"] ?? null,
        department: data["department"] ?? null,
        // convert json to iterable then to list
        listOfModules: List<String>.from(data["modules"].map((x) => x)),

        description: data["project_desc"] ?? null,
        createdAt: data["createdAt"] ?? null,
        updatedAt: data["updatedAt"] ?? null,
        //members: data["members"] ?? null,
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
