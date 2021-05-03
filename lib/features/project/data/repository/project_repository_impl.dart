import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/data/model/project_model.dart';
import 'package:wowca_task/features/project/data/sources/project_remote_data_source.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final NetworkInfo networkInfo;
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, ProjectModel>> createProject({
    String projectId,
    String projectName,
    String department,
    List<ModuleEntity> listOfModules,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.createProject(
          projectId: projectId,
          projectName: projectName,
          department: department,
          listOfModules: listOfModules,
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

  Future<Either<Failure, List<ProjectModel>>> getProject() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getProject());
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
