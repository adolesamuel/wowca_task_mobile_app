part of 'module_bloc.dart';

abstract class ModuleState extends Equatable {
  const ModuleState();
  
  @override
  List<Object> get props => [];
}

class ModuleInitial extends ModuleState {}
