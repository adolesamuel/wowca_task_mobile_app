import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, RegisteredUserEntity>> register({
    String email,
    String password,
    String name,
    String orgName,
  });

  Future<Either<Failure, SignedInUserEntity>> signIn({
    String email,
    String password,
  });

  Future<Either<Failure, SignedInUserEntity>> verify({
    String code,
  });
}
