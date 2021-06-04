import 'package:equatable/equatable.dart';

class ModuleEntity extends Equatable {
  final String moduleId;
  final String moduleName;
  final String moduleDescription;
  final double percentCompletion;
  final List<String> listOfTasks;
  final String projectId;
  final String createdDate;
  final String updatedDate;

  ModuleEntity({
    this.moduleId,
    this.moduleName,
    this.percentCompletion = 0,
    this.moduleDescription,
    this.listOfTasks,
    this.projectId,
    this.createdDate,
    this.updatedDate,
  });

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        percentCompletion,
        moduleDescription,
        listOfTasks,
        projectId,
        updatedDate,
        createdDate,
      ];
}
