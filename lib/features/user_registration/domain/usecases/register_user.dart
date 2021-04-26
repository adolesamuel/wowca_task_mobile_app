import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/RegistrationRepository.dart';

class RegisterUser extends Usecase<RegisteredUserEntity, RegistrationParams> {
  final RegistrationRepository registrationRepository;

  RegisterUser(this.registrationRepository);

  @override
  Future<Either<Failure, RegisteredUserEntity>> call(
      RegistrationParams params) async {
    return await registrationRepository.register(
      orgName: params.orgName,
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegistrationParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String orgName;

  RegistrationParams({
    this.name,
    this.email,
    this.password,
    this.orgName,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        orgName,
      ];
}
