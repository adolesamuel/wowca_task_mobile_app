import 'package:wowca_task/features/dashboard/app/widgets/project_item.dart';
import 'package:wowca_task/features/dashboard/app/widgets/task_item.dart';

class Module extends Project {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<TaskItem> listOfTasks;
  final String projectName;

  Module({
    this.moduleId,
    this.moduleName,
    this.percentCompletion,
    this.listOfTasks,
    this.projectName,
  });
}
