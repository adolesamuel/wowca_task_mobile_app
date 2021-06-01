part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class CreateProjectEvent extends ProjectEvent {
  final String projectName;
  final String projectDescription;

  CreateProjectEvent({
    this.projectName,
    this.projectDescription,
  });
}

class GetProjectsEvent extends ProjectEvent {}

class GetOneProjectEvent extends ProjectEvent {
  final String projectId;

  GetOneProjectEvent(this.projectId);
}

class DeleteProjectEvent extends ProjectEvent {
  final String projectId;

  DeleteProjectEvent(this.projectId);
}
