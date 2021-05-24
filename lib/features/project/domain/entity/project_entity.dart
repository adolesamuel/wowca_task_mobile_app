import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String projectId;
  final String projectName;
  final String department;
  final List<String> listOfModules;

  ProjectEntity({
    this.projectId,
    this.projectName,
    this.department,
    this.listOfModules,
  });

  @override
  List<Object> get props => [
        projectId,
        projectName,
        department,
        listOfModules,
      ];
}
