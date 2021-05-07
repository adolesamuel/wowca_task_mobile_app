import 'dart:io';

import 'package:wowca_task/features/task/domain/entities/create_task_entity.dart';

class CreateTaskModel extends CreateTaskEntity {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<File> listOfMediaFileUrls;

  CreateTaskModel({
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
