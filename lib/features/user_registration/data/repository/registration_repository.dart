import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/errors/exception.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/network_info/network_info.dart';
import 'package:wowca_task/features/user_registration/data/model/registered_user_model.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_local_data_source.dart';
import 'package:wowca_task/features/user_registration/data/sources/registration_remote_data_source.dart';
import 'package:wowca_task/features/user_registration/domain/repository/RegistrationRepository.dart';

const SERVER_FAILURE_TITLE = 'Server Failure',
    SERVER_FAILURE_MESSAGE = 'SERVER FAILURE_MESSAGE';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final NetworkInfo networkInfo;
  final RegistrationRemoteDataSource remoteDataSource;
  final RegistrationLocalDataSource localDataSource;

  RegistrationRepositoryImpl(
      this.networkInfo, this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, RegisteredUserModel>> register({
    String username,
    String firstname,
    String lastname,
    String email,
    String phone,
    String password,
    String apiKey,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        Right(await remoteDataSource.registerUser(
            username: username,
            email: email,
            firstname: firstname,
            lastname: lastname,
            phone: phone,
            password: password,
            apiKey: apiKey));
      }
    } on ServerException {
      return Left(ServerFailure(
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ));
    }
  }
}
