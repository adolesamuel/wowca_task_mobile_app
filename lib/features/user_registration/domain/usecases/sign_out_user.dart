import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/user_registration/domain/repository/registration_repository.dart';

class SignOutUser extends Usecase<bool, SignOutParams> {
  final RegistrationRepository signOutRepository;

  SignOutUser(this.signOutRepository);

  @override
  Future<Either<Failure, bool>> call(SignOutParams params) async {
    return await signOutRepository.signOut();
  }
}

class SignOutParams extends Equatable {
  SignOutParams();
  @override
  List<Object> get props => [];
}
