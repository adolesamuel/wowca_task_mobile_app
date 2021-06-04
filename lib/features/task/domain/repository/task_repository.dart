import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/task/domain/entities/delete_task_success_entity.dart';
import 'package:wowca_task/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> createTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String deadline,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  });
  Future<Either<Failure, TaskEntity>> updateTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String deadline,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  });

  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, TaskEntity>> getOneTask({String taskId});
  Future<Either<Failure, TaskEntity>> startTask({String taskId});
  Future<Either<Failure, TaskEntity>> suspendTask({String taskId});
  Future<Either<Failure, TaskEntity>> finishTask({String taskId});
  Future<Either<Failure, TaskEntity>> resetTask({String taskId});
  Future<Either<Failure, DeleteTaskSuccessEntity>> deleteTask({String taskId});
}
