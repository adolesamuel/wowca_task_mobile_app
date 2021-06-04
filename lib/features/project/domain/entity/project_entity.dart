import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String projectId;
  final String projectName;
  final String department;
  final String description;
  final List<String> listOfModules;
  final String createdAt;
  final String updatedAt;
  final List<String> members;

  ProjectEntity({
    this.projectId,
    this.projectName,
    this.department,
    this.listOfModules,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.members,
  });

  @override
  List<Object> get props => [
        projectId,
        projectName,
        department,
        listOfModules,
        description,
        createdAt,
        updatedAt,
        members,
      ];
}
