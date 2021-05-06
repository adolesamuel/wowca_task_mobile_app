import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/data/model/module_model.dart';
import 'package:wowca_task/features/module/data/sources/module_remote_data_source.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';
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
    List<GetTaskEntity> listOfTasks,
    String projectName,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.createModule());
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

  Future<Either<Failure, List<ModuleModel>>> getModule() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getModule());
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
