import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/data/models/delete_dept_success_model.dart';
import 'package:wowca_task/features/departments/data/models/dept_model.dart';
import 'package:wowca_task/features/departments/data/sources/department_local_data_source.dart';
import 'package:wowca_task/features/departments/data/sources/department_remote_data_source.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final NetworkInfo _networkInfo;
  final DepartmentRemoteDataSource _remoteDataSource;
  final DepartmentLocalDataSource _localDataSource;

  DepartmentRepositoryImpl(
      this._networkInfo, this._remoteDataSource, this._localDataSource);
  // Does department need a local data source?
  //

  @override
  Future<Either<Failure, DeptModel>> createDept({
    String deptDescription,
    String deptName,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          final remoteData = await _remoteDataSource.createDept(
            deptName: deptName,
            deptDescription: deptDescription,
          );
          // localDataSource
          //     .cacheCreatedDepartmentData(DeptEntity().from(remoteData));
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
  Future<Either<Failure, List<DeptModel>>> getDept() async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          return Right(await _remoteDataSource.getDept());
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
  Future<Either<Failure, DeleteDeptSuccessModel>> deleteDept(
      {String deptId}) async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          final remoteData = await _remoteDataSource.deleteDept(deptId: deptId);

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
  Future<Either<Failure, DeptEntity>> getOneDept({String deptId}) async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          final remoteData = await _remoteDataSource.getOneDept(deptId: deptId);
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
  Future<Either<Failure, DeptEntity>> updateDept({
    String departmentDescription,
    String departmentId,
    String departmentName,
    List<String> listofUsers,
    List<String> listofProject,
    String companyId,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        try {
          final remoteData = await _remoteDataSource.updateDept(
            deptName: departmentName,
            deptDescription: departmentDescription,
            departmentId: departmentId,
            companyId: companyId,
            listOfUsers: listofUsers,
            listOfProjects: listofProject,
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
