part of 'signup_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignUpState {}

class RegisterUserLoadingState extends SignUpState {}

class UserRegisteredState extends SignUpState {
  final RegisteredUserEntity registeredUserEntity;

  UserRegisteredState(this.registeredUserEntity);
}

class RegistrationErrorState extends SignUpState {
  final Failure failure;

  RegistrationErrorState(this.failure);
}

class SignInErrorState extends SignUpState {
  final Failure failure;

  SignInErrorState(this.failure);
}

class SignedInUserState extends SignUpState {
  final SignedInUserEntity signedInUserEntity;

  SignedInUserState(
    this.signedInUserEntity,
  );
}

class VerificationLoadingState extends SignUpState {}

class VerifiedUserState extends SignUpState {
  final SignedInUserEntity verifiedUserEntity;

  VerifiedUserState(this.verifiedUserEntity);
}

class VerificationErrorState extends SignUpState {
  final Failure failure;

  VerificationErrorState(this.failure);
}

class SignOutLoadingState extends SignUpState {}

class SignOutErrorState extends SignUpState {
  final Failure failure;
  SignOutErrorState(this.failure);
}

class SignedOutState extends SignUpState {
  final bool signedOutUserEntity;

  SignedOutState(this.signedOutUserEntity);
}
