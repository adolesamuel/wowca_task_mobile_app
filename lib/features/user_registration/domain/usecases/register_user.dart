import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/register_user_entity.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/RegistrationRepository.dart';

class RegisterUser extends Usecase<RegisteredUserEntity, RegistrationParams> {
  final RegistrationRepository registrationRepository;

  RegisterUser(this.registrationRepository);

  @override
  Future<Either<Failure, RegisteredUserEntity>> call(
      RegistrationParams params) async {
    return await registrationRepository.register(
      registerUser: params.registerUserEntity,
    );
  }
}

class RegistrationParams extends Equatable {
  final RegisterUserEntity registerUserEntity;

  RegistrationParams({
    this.registerUserEntity,
  });

  @override
  List<Object> get props => [
        registerUserEntity,
      ];
}
