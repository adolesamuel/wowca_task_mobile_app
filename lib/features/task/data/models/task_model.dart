import 'dart:io';

import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String deadline;
  final String taskDescription;
  final List<File> listOfMediaFileUrls;

  TaskModel({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.deadline,
    this.taskDescription,
    this.listOfMediaFileUrls,
  }) : super(
          taskId: taskId,
          started: started,
          completed: completed,
          taskName: taskName,
          deadline: deadline,
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
        deadline: data['deadline'],
        taskName: data['task_title'],
        taskDescription: data['task_desc'],
        // listOfMediaFileUrls: data[''],
      );
    }
  }
}
