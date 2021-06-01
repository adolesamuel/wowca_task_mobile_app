part of 'module_bloc.dart';

abstract class ModuleState extends Equatable {
  const ModuleState();

  @override
  List<Object> get props => [];
}

class ModuleInitial extends ModuleState {}

class ModuleLoadingState extends ModuleState {}

class ErrorModuleState extends ModuleState {
  final Failure failure;

  ErrorModuleState(this.failure);
}

class ListOfModulesReceivedState extends ModuleState {
  final List<ModuleEntity> modules;

  ListOfModulesReceivedState(this.modules);
}

class CreatedModuleState extends ModuleState {
  final ModuleEntity module;

  CreatedModuleState(this.module);
}

class ReceivedOneModuleState extends ModuleState {
  final ModuleEntity module;

  ReceivedOneModuleState(this.module);
}

class DeleteModuleSuccessState extends ModuleState {
  final DeleteModuleSuccessEntity deletedModule;

  DeleteModuleSuccessState(this.deletedModule);
}
