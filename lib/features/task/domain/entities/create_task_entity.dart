import 'dart:io';

import 'package:equatable/equatable.dart';

class CreateTaskEntity extends Equatable {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<File> listOfMediaFileUrls;

  CreateTaskEntity({
    this.taskId,
    this.started,
    this.completed,
    this.taskName,
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
      ];
}