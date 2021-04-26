import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/user_registration/data/model/register_user_data.dart';
import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';
import 'package:wowca_task/features/user_registration/domain/usecases/register_user.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegisterUser registerUser;

  SignUpBloc({
    this.registerUser,
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
  }
}
