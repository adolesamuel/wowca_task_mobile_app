import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/task/domain/entities/create_task_entity.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, CreateTaskEntity>> createTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  });

  Future<Either<Failure, List<GetTaskEntity>>> getTask();
}
