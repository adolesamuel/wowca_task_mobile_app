import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/project/domain/entity/delete_project_success_entity.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/usecase/create_project.dart';
import 'package:wowca_task/features/project/domain/usecase/delete_project.dart';
import 'package:wowca_task/features/project/domain/usecase/get_one_project.dart';
import 'package:wowca_task/features/project/domain/usecase/get_projects.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final CreateProject createProject;
  final DeleteProject deleteProject;
  final GetProjects getProjects;
  final GetOneProject getOneProject;

  ProjectBloc({
    this.createProject,
    this.deleteProject,
    this.getProjects,
    this.getOneProject,
  }) : super(ProjectInitial());

  @override
  Stream<ProjectState> mapEventToState(
    ProjectEvent event,
  ) async* {
    if (event is CreateProjectEvent) {
      //CreateProject

      yield ProjectLoadingState();

      final createProjectOrError = await createProject(CreateProjectParams(
        projectName: event.projectName,
        projectDescription: event.projectDescription,
      ));

      yield createProjectOrError.fold((failure) => ErrorProjectState(failure),
          (project) => CreatedProjectState(project));
    } else if (event is GetProjectsEvent) {
      //GetProject

      yield ProjectLoadingState();

      final getProjectsOrError = await getProjects(GetProjectParams());

      yield getProjectsOrError.fold((failure) => ErrorProjectState(failure),
          (projects) => ListOfProjectsReceivedState(projects));
    } else if (event is GetOneProjectEvent) {
      //GetOneProject

      yield ProjectLoadingState();

      final getOneProjectOrError =
          await getOneProject(GetOneProjectParams(event.projectId));

      yield getOneProjectOrError.fold((failure) => ErrorProjectState(failure),
          (project) => ReceivedOneProjectState(project));
    } else if (event is DeleteProjectEvent) {
      //DeleteProject

      yield ProjectLoadingState();

      final deleteProjectOrError =
          await deleteProject(DeleteProjectParams(event.projectId));

      yield deleteProjectOrError.fold((failure) => ErrorProjectState(failure),
          (status) => DeleteProjectSuccessState(status));
    }
  }
}
