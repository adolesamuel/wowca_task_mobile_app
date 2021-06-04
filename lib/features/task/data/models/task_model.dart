import 'dart:io';

import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String deadline;
  final bool pending;
  final String taskDescription;
  final String moduleId;
  final String createdDate;
  final String updatedDate;
  final List<File> listOfMediaFileUrls;

  TaskModel({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.deadline,
    this.pending,
    this.moduleId,
    this.createdDate,
    this.updatedDate,
    this.taskDescription,
    this.listOfMediaFileUrls,
  }) : super(
          taskId: taskId,
          started: started,
          completed: completed,
          taskName: taskName,
          deadline: deadline,
          pending: pending,
          moduleId: moduleId,
          createdDate: createdDate,
          updatedDate: updatedDate,
          taskDescription: taskDescription,
          listOfMediaFileUrls: listOfMediaFileUrls,
        );

  factory TaskModel.fromJson(Map<String, dynamic> data) {
    if (data == null)
      return TaskModel();
    else {
      return TaskModel(
        taskId: data['_id'],
        started: data['started'],
        completed: data['finished'],
        deadline: data['deadline'],
        pending: data['pending'],
        createdDate: data['createdAt'],
        updatedDate: data['updatedAt'],
        taskName: data['task_title'],
        taskDescription: data['task_desc'],
        // listOfMediaFileUrls: data[''],
      );
    }
  }
}
