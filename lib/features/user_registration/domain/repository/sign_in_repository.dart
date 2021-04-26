import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignedInUserEntity>> signIn({
    String email,
    String password,
  });
}
