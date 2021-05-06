import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/data/repository/registration_repository.dart';
import 'package:wowca_task/features/users/data/sources/user_local_data_source.dart';
import 'package:wowca_task/features/users/data/sources/user_remote_data_source.dart';
import 'package:wowca_task/features/users/domain/entity/user_entity.dart';
import 'package:wowca_task/features/users/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(
      this.networkInfo, this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, UserEntity>> getOneUser({
    String email,
    String password,
    String orgName,
    String name,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await remoteDataSource.getOneUser());
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
  Future<Either<Failure, List<UserEntity>>> getUsers({
    String email,
    String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteData = await remoteDataSource.getUsers();

        return Right(remoteData);
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(SERVER_FAILURE_TITLE, SERVER_FAILURE_MESSAGE));
    }
  }
}
