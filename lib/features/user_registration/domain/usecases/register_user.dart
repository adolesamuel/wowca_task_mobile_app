import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/RegistrationRepository.dart';

class RegisterUser extends Usecase<RegisteredUser, RegistrationParams> {
  final RegistrationRepository registrationRepository;

  RegisterUser(this.registrationRepository);

  @override
  Future<Either<Failure, RegisteredUser>> call(
      RegistrationParams params) async {
    return await registrationRepository.register(
        username: params.username,
        firstname: params.firstname,
        lastname: params.lastname,
        email: params.email,
        phone: params.phone,
        password: params.password,
        apiKey: params.apiKey);
  }
}

class RegistrationParams extends Equatable {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String apiKey;

  RegistrationParams(
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.password,
    this.apiKey,
  );

  @override
  List<Object> get props => [
        username,
        firstname,
        lastname,
        email,
        phone,
        password,
        apiKey,
      ];
}
