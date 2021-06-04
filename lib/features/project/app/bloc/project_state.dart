part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoadingState extends ProjectState {}

class ErrorProjectState extends ProjectState {
  final Failure failure;

  ErrorProjectState(this.failure);
}

class ListOfProjectsReceivedState extends ProjectState {
  final List<ProjectEntity> projects;

  ListOfProjectsReceivedState(this.projects);
}

class CreatedProjectState extends ProjectState {
  final ProjectEntity project;

  CreatedProjectState(this.project);
}

class ReceivedOneProjectState extends ProjectState {
  final ProjectEntity project;

  ReceivedOneProjectState(this.project);
}

class DeleteProjectSuccessState extends ProjectState {
  final DeleteProjectSuccessEntity deletedProject;

  DeleteProjectSuccessState(this.deletedProject);
}
