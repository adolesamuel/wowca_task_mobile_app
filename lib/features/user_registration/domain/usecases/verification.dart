import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';

class VerifyUser extends Usecase<SignedInUserEntity, VerificationParams> {
  final RegistrationRepository verificationRepository;

  VerifyUser(this.verificationRepository);

  @override
  Future<Either<Failure, SignedInUserEntity>> call(
      VerificationParams params) async {
    return await verificationRepository.verify(
      code: params.code,
    );
  }
}

class VerificationParams extends Equatable {
  final String code;

  VerificationParams({this.code});

  @override
  List<Object> get props => [code];
}
