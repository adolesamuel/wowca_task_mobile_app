import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/task/domain/entities/create_task_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';

class CreateTask extends Usecase<CreateTaskEntity, CreateTaskParams> {
  final TaskRepository taskRepository;

  CreateTask(this.taskRepository);

  @override
  Future<Either<Failure, CreateTaskEntity>> call(
      CreateTaskParams params) async {
    return await taskRepository.createTask(
      taskId: params.taskId,
      started: params.started,
      completed: params.completed,
      taskName: params.taskName,
      taskDescription: params.taskDescription,
      listOfMediaFileUrls: params.listOfMediaFileUrls,
    );
  }
}

class CreateTaskParams extends Equatable {
  final String taskId;
  final bool started;
  final bool completed;
  final String taskName;
  final String taskDescription;
  final List<File> listOfMediaFileUrls;

  CreateTaskParams(
      {this.taskId,
      this.started,
      this.completed,
      this.taskName,
      this.taskDescription,
      this.listOfMediaFileUrls});

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
