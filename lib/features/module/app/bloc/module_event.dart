part of 'module_bloc.dart';

abstract class ModuleEvent extends Equatable {
  const ModuleEvent();

  @override
  List<Object> get props => [];
}

class CreateModuleEvent extends ModuleEvent {
  final String moduleName;
  final String moduleDescription;

  CreateModuleEvent({this.moduleName, this.moduleDescription});
}

class GetModulesEvent extends ModuleEvent {}

class GetOneModuleEvent extends ModuleEvent {
  final String moduleId;

  GetOneModuleEvent(this.moduleId);
}

class DeleteModuleEvent extends ModuleEvent {
  final String moduleId;

  DeleteModuleEvent(this.moduleId);
}
