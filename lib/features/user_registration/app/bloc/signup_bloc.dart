import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/signin_user.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegisterUser registerUser;
  final SignInUser signInUser;

  SignUpBloc({
    this.registerUser,
    this.signInUser,
  }) : super(SignupInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is RegisterUserEvent) {
      yield RegisterUserLoadingState();

      //expect an error from here

      final registerOrError = await registerUser(
        RegistrationParams(
          name: event.name,
          password: event.password,
          email: event.email,
          orgName: event.orgName,
        ),
      );

      yield registerOrError.fold((failure) => RegistrationErrorState(failure),
          (registeredUserEntity) => UserRegisteredState(registeredUserEntity));
    }
    if (event is SignInUserEvent) {
      yield RegisterUserLoadingState();

      final signInOrError = await signInUser(
          SignInParams(email: event.email, password: event.password));
      yield signInOrError.fold((failure) => SignInErrorState(failure),
          (signedInUserEntity) => SignedInUserState(signedInUserEntity));
    }
  }
}
