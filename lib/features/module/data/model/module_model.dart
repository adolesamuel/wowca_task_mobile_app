import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

class ModuleModel extends ModuleEntity {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<GetTaskEntity> listOfTasks;
  final String projectName;

  ModuleModel(
      {this.moduleId,
      this.moduleName,
      this.percentCompletion,
      this.listOfTasks,
      this.projectName})
      : super(
          moduleId: moduleId,
          moduleName: moduleName,
          percentCompletion: percentCompletion,
          listOfTasks: listOfTasks,
          projectName: projectName,
        );
}
