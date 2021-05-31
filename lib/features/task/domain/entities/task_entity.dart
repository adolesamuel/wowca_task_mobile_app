import 'dart:io';

import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final bool pending;

  final String deadline;
  final String moduleId;
  final String createdDate;
  final String updatedDate;
  final List<File> listOfMediaFileUrls;

  TaskEntity({
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
  });

  @override
  List<Object> get props => [
        taskId,
        started,
        completed,
        taskName,
        taskDescription,
        listOfMediaFileUrls,
        deadline,
        pending,
        moduleId,
        createdDate,
        updatedDate,
      ];
}
