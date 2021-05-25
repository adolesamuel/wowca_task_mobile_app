import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/data/model/delete_module_success_model.dart';
import 'package:wowca_task/features/module/data/model/module_model.dart';
import 'package:wowca_task/features/module/data/sources/module_remote_data_source.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final NetworkInfo networkInfo;
  final ModuleRemoteDataSource remoteDataSource;

  ModuleRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, ModuleModel>> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    String moduleDescription,
    List<String> listOfTasks,
    String projectId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.createModule(
            moduleId: moduleId,
            moduleName: moduleName,
            percentCompletion: percentCompletion,
            moduleDescription: moduleDescription,
            listOfTasks: listOfTasks,
            projectId: projectId,
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

  @override
  Future<Either<Failure, List<ModuleModel>>> getModules() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.getModules());
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
  Future<Either<Failure, DeleteModuleSuccessModel>> deleteModule(
      {String moduleId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData =
              await remoteDataSource.deleteModule(moduleId: moduleId);

          return Right(remoteData);
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
  Future<Either<Failure, ModuleModel>> getOneModule({String moduleId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData =
              await remoteDataSource.getOneModule(moduleId: moduleId);
          return Right(remoteData);
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
  Future<Either<Failure, ModuleModel>> updateModule(
      {String moduleId,
      String moduleName,
      double percentCompletion,
      String moduleDescription,
      List<String> listOfTasks,
      String projectId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData = await remoteDataSource.updateModule(
            moduleId: moduleId,
            moduleName: moduleName,
            percentCompletion: percentCompletion,
            moduleDescription: moduleDescription,
            listOfTasks: listOfTasks,
            projectId: projectId,
          );

          return Right(remoteData);
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
