part of 'signup_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignUpState {}

class RegisterUserLoadingState extends SignUpState {}
