import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/task/app/widgets/task_model.dart';

class Module extends Project {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<TaskModel> listOfTasks;
  final String projectName;

  Module({
    this.moduleId,
    this.moduleName,
    this.percentCompletion,
    this.listOfTasks,
    this.projectName,
  });
}
