import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/module/domain/entity/delete_module_success_entity.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/usecases/create_module.dart';
import 'package:wowca_task/features/module/domain/usecases/delete_module.dart';
import 'package:wowca_task/features/module/domain/usecases/get_modules.dart';
import 'package:wowca_task/features/module/domain/usecases/get_one_module.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  final CreateModule createModule;
  final DeleteModule deleteModule;
  final GetModules getModules;
  final GetOneModule getOneModule;

  ModuleBloc({
    this.createModule,
    this.deleteModule,
    this.getModules,
    this.getOneModule,
  }) : super(ModuleInitial());

  @override
  Stream<ModuleState> mapEventToState(
    ModuleEvent event,
  ) async* {
    if (event is CreateModuleEvent) {
      //CreateModule

      yield ModuleLoadingState();

      final createModuleOrError = await createModule(CreateModuleParams(
        moduleName: event.moduleName,
        moduleDescription: event.moduleDescription,
      ));

      yield createModuleOrError.fold((failure) => ErrorModuleState(failure),
          (module) => CreatedModuleState(module));
    } else if (event is GetModulesEvent) {
      //GetModule

      yield ModuleLoadingState();
      final getModulesOrError = await getModules(GetModuleParams());

      yield getModulesOrError.fold((failure) => ErrorModuleState(failure),
          (modules) => ListOfModulesReceivedState(modules));
    } else if (event is GetOneModuleEvent) {
      //GetOneModule

      yield ModuleLoadingState();
      final getOneModuleOrError =
          await getOneModule(GetOneModuleParams(event.moduleId));

      yield getOneModuleOrError.fold((failure) => ErrorModuleState(failure),
          (module) => ReceivedOneModuleState(module));
    } else if (event is DeleteModuleEvent) {
      //DeleteModule

      yield ModuleLoadingState();

      final deleteModuleOrError =
          await deleteModule(DeleteModuleParams(event.moduleId));

      yield deleteModuleOrError.fold((failure) => ErrorModuleState(failure),
          (status) => DeleteModuleSuccessState(status));
    }
  }
}
