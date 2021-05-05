import 'package:equatable/equatable.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

class ModuleEntity extends Equatable {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<GetTaskEntity> listOfTasks;
  final String projectName;

  ModuleEntity(
      {this.moduleId,
      this.moduleName,
      this.percentCompletion,
      this.listOfTasks,
      this.projectName});

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        percentCompletion,
        listOfTasks,
        projectName,
      ];
}
