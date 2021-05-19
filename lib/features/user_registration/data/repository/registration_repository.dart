import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_remote_data_source.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';

const SERVER_FAILURE_TITLE = 'Server Failure',
    SERVER_FAILURE_MESSAGE = 'SERVER FAILURE_MESSAGE';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final NetworkInfo networkInfo;
  final RegistrationRemoteDataSource remoteDataSource;
  final RegistrationLocalDataSource localDataSource;

  RegistrationRepositoryImpl(
      this.networkInfo, this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, RegisteredUserEntity>> register({
    String email,
    String password,
    String name,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.registerUser(
            name: name,
            email: email,
            password: password,
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
  Future<Either<Failure, SignedInUserEntity>> signIn({
    String email,
    String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteData =
            await remoteDataSource.signInUser(email: email, password: password);

        localDataSource.cacheRegisteredUserData(remoteData);
        return Right(remoteData);
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(SERVER_FAILURE_TITLE, SERVER_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, SignedInUserEntity>> verify({String code}) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          return Right(await remoteDataSource.verifyUser(code: code));
        } catch (e) {
          return Left(CommonFailure(e.title, e.message));
        }
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(SERVER_FAILURE_TITLE, SERVER_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await localDataSource.signOut());
      } else {
        return Left(InternetFailure(
            NO_INTERNET_ERROR_TITLE, NO_INTERNET_ERROR_MESSAGE));
      }
    } on ServerException {
      return Left(ServerFailure(SERVER_FAILURE_TITLE, SERVER_FAILURE_MESSAGE));
    }
  }
}
