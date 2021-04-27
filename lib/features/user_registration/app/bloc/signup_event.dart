part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends SignUpEvent {
  final String name;
  final String password;
  final String email;
  final String orgName;

  RegisterUserEvent({
    this.name,
    this.password,
    this.email,
    this.orgName,
  });
}

class SignInUserEvent extends SignUpEvent {
  final String email;
  final String password;

  SignInUserEvent(this.email, this.password);
}

class VerifyUserEvent extends SignUpEvent {
  final String code;

  VerifyUserEvent(this.code);
}
