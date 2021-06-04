import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/project/data/model/project_model.dart';
import 'package:wowca_task/features/project/data/sources/project_remote_data_source.dart';
import 'package:wowca_task/features/project/domain/entity/delete_project_success_entity.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final NetworkInfo networkInfo;
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, ProjectModel>> createProject({
    String projectName,
    String department,
    String projectDescription,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.createProject(
            projectName: projectName,
            department: department,
            projectDescription: projectDescription,
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

  Future<Either<Failure, List<ProjectModel>>> getProjects() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.getProjects());
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
  Future<Either<Failure, DeleteProjectSuccessEntity>> deleteProject(
      {String projectId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData =
              await remoteDataSource.deleteProject(projectId: projectId);

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
  Future<Either<Failure, ProjectEntity>> getOneProject(
      {String projectId}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData =
              await remoteDataSource.getOneProject(projectId: projectId);
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
  Future<Either<Failure, ProjectEntity>> updateProject(
      {String projectId,
      String projectName,
      List<String> listOfModules,
      String projectDescription,
      String department}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteData = await remoteDataSource.updateProject(
            projectName: projectName,
            projectDescription: projectDescription,
            projectId: projectId,
            department: department,
            listOfModules: listOfModules,
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
