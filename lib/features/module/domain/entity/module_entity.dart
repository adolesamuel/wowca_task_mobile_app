import 'package:equatable/equatable.dart';

class ModuleEntity extends Equatable {
  final String moduleId;
  final String moduleName;
  final String moduleDescription;
  final double percentCompletion;
  final List<String> listOfTasks;
  final String projectId;

  ModuleEntity(
      {this.moduleId,
      this.moduleName,
      this.percentCompletion,
      this.moduleDescription,
      this.listOfTasks,
      this.projectId});

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        percentCompletion,
        moduleDescription,
        listOfTasks,
        projectId,
      ];
}
