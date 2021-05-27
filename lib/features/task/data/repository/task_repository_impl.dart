import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/task/data/models/delete_task_success_model.dart';
import 'package:wowca_task/features/task/data/models/task_model.dart';
import 'package:wowca_task/features/task/data/sources/task_remote_data_source.dart';
import 'package:wowca_task/features/task/domain/repository/task_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final NetworkInfo networkInfo;
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl(
    this.networkInfo,
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, TaskModel>> createTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String deadline,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final createTask = await remoteDataSource
              .createTask(
                taskId: taskId,
                started: started,
                completed: completed,
                taskName: taskName,
                taskDescription: taskDescription,
                listOfMediaFileUrls: listOfMediaFileUrls,
              )
              .timeout(Duration(seconds: 20));
          return Right(createTask);
        } catch (e) {
          print('Task$e');
          return Left(CommonFailure('Error', 'Error Message'));
        }
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
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.getTasks());
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, DeleteTaskSuccessModel>> deleteTask(
      {String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.deleteTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> finishTask({String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.finishTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> getOneTask({String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.getOneTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> resetTask({String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.resetTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> startTask({String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.startTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> suspendTask({String taskId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.suspendTask(taskId: taskId));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
  Future<Either<Failure, TaskModel>> updateTask({
    String taskId,
    bool started,
    bool completed,
    String taskName,
    String deadline,
    String taskDescription,
    List<File> listOfMediaFileUrls,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.updateTask(
            taskId: taskId,
            started: started,
            completed: completed,
            deadline: deadline,
            taskName: taskName,
            taskDescription: taskDescription,
            listOfMediaFileUrls: listOfMediaFileUrls,
          ));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
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
