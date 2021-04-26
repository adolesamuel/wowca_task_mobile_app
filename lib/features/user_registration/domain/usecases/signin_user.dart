import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/user_registration/domain/repository/sign_in_repository.dart';

class SignInUser extends Usecase<SignedInUserEntity, SignInParams> {
  final SignInRepository signInRepository;

  SignInUser(this.signInRepository);

  @override
  Future<Either<Failure, SignedInUserEntity>> call(SignInParams params) async {
    return await signInRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  SignInParams({this.email, this.password});

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
