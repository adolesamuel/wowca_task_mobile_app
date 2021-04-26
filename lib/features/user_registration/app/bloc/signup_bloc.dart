import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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
    }
  }
}
