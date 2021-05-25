import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<String> listOfMediaFileUrls;

  TaskModel({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.taskDescription,
    this.listOfMediaFileUrls,
  }) : super(
          taskId: taskId,
          started: started,
          completed: completed,
          taskName: taskName,
          taskDescription: taskDescription,
          listOfMediaFileUrls: listOfMediaFileUrls,
        );
}
