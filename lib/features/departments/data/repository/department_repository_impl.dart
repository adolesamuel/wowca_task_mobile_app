import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/departments/data/models/create_dept_model.dart';
import 'package:wowca_task/features/departments/data/models/get_dept.dart';
import 'package:wowca_task/features/departments/data/sources/department_local_data_source.dart';
import 'package:wowca_task/features/departments/data/sources/department_remote_data_source.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final NetworkInfo networkInfo;
  final DepartmentRemoteDataSource remoteDataSource;
  final DepartmentLocalDataSource localDataSource;

  DepartmentRepositoryImpl(
      this.networkInfo, this.remoteDataSource, this.localDataSource);
  // Does department need a local data source?
  //

  @override
  Future<Either<Failure, CreatedDeptModel>> createDept({
    String deptDescription,
    String deptName,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteData = await remoteDataSource.createDept(
          deptTitle: deptName,
          deptDescription: deptDescription,
        );
        localDataSource
            .cacheCreatedDepartmentData(DeptEntity().from(remoteData));
        return Right(remoteData);
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
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getDept());
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
