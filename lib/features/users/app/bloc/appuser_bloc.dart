import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appuser_event.dart';
part 'appuser_state.dart';

class AppuserBloc extends Bloc<AppuserEvent, AppuserState> {
  AppuserBloc() : super(AppuserInitial());

  @override
  Stream<AppuserState> mapEventToState(
    AppuserEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
