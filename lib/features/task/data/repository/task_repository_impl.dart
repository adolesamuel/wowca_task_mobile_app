import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/task/data/models/get_task_model.dart';
import 'package:wowca_task/features/task/data/sources/task_local_data_source.dart';
import 'package:wowca_task/features/task/data/sources/task_remote_data_source.dart';
import 'package:wowca_task/features/task/domain/entities/create_task_entity.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final NetworkInfo networkInfo;
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(
      this.networkInfo, this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, CreateTaskEntity>> createTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.createTask(
          taskId: taskId,
          started: started,
          completed: completed,
          taskName: taskName,
          taskDescription: taskDescription,
          listOfMediaFileUrls: listOfMediaFileUrls,
        ));
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }

  @override
  Future<Either<Failure, List<GetTaskModel>>> getTask() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getTask());
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }
}
