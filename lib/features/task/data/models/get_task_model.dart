import 'dart:io';

import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

class GetTaskModel extends GetTaskEntity {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<File> listOfMediaFileUrls;

  GetTaskModel({
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
