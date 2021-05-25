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

  factory TaskModel.fromJson(Map<String, dynamic> data) {
    if (data == null)
      return TaskModel();
    else {
      return TaskModel(
        taskId: data['_id'],
        // started: data[''],
        //completed: data[''],
        taskName: data['task_title'],
        taskDescription: data['task_desc'],
        // listOfMediaFileUrls: data[''],
      );
    }
  }
}
