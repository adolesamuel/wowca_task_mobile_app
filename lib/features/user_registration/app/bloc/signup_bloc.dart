import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/sign_out_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/signin_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/verification.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegisterUser registerUser;
  final SignInUser signInUser;
  final VerifyUser verifyUser;
  final SignOutUser signOutUser;

  SignUpBloc({
    this.registerUser,
    this.signInUser,
    this.verifyUser,
    this.signOutUser,
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

    if (event is VerifyUserEvent) {
      yield VerificationLoadingState();

      final verifyOrError = await verifyUser(
        VerificationParams(code: event.code),
      );

      yield verifyOrError.fold((failure) => VerificationErrorState(failure),
          (signedInUserEntity) => VerifiedUserState(signedInUserEntity));
    }

    if (event is SignOutEvent) {
      yield SignOutLoadingState();

      final isTrueOrFailed = await signOutUser(SignOutParams());

      yield isTrueOrFailed.fold((failure) => SignOutErrorState(failure),
          (isLoggedOut) => SignedOutState(isLoggedOut));
    }
  }
}
