import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';

class RegisterUser extends Usecase<RegisteredUserEntity, RegistrationParams> {
  final RegistrationRepository registrationRepository;

  RegisterUser(this.registrationRepository);

  @override
  Future<Either<Failure, RegisteredUserEntity>> call(
      RegistrationParams params) async {
    return await registrationRepository.register(
      name: params.name,
      password: params.password,
      email: params.email,
    );
  }
}

class RegistrationParams extends Equatable {
  final String name;
  final String password;
  final String email;

  RegistrationParams({
    this.name,
    this.password,
    this.email,
  });

  @override
  List<Object> get props => [
        name,
        password,
        email,
      ];
}
