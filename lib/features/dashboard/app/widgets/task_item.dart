import 'package:wowca_task/features/dashboard/app/widgets/module_item.dart';

class TaskItem extends Module {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String description;
  final Map<String, dynamic> mapOfMediaFiles;
  final String moduleName;

  TaskItem({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.description,
    this.mapOfMediaFiles,
    this.moduleName,
  });
}
