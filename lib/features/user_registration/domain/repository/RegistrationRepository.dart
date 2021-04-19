import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, RegisteredUser>> register({
    String username,
    String firstname,
    String lastname,
    String email,
    String phone,
    String password,
    String apiKey,
  });
}
