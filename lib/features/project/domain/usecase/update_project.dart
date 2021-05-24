import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';

class UpdateProject extends Usecase<ProjectEntity, UpdateProjectParams> {
  final ProjectRepository projectRepository;

  UpdateProject(this.projectRepository);

  @override
  Future<Either<Failure, ProjectEntity>> call(
      UpdateProjectParams params) async {
    return await projectRepository.updateProject(
      projectId: params.projectId,
      projectName: params.projectName,
      listOfModules: params.listOfModules,
      department: params.department,
    );
  }
}

class UpdateProjectParams extends Equatable {
  final String projectId;
  final String projectName;
  final List<String> listOfModules;
  final String department;

  UpdateProjectParams(
    this.projectId,
    this.projectName,
    this.listOfModules,
    this.department,
  );

  @override
  List<Object> get props => [
        projectId,
        projectName,
        listOfModules,
        department,
      ];
}
