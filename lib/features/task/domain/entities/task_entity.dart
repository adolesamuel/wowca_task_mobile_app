import 'dart:io';

import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final String deadline;
  final List<File> listOfMediaFileUrls;

  TaskEntity({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
    this.deadline,
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
      ];
}
