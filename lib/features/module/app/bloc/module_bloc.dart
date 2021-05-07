import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  ModuleBloc() : super(ModuleInitial());

  @override
  Stream<ModuleState> mapEventToState(
    ModuleEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
