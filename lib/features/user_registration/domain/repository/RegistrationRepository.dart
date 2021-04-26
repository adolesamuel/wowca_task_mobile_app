import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, RegisteredUserEntity>> register({
    String email,
    String name,
    String password,
    String orgName,
  });
}
