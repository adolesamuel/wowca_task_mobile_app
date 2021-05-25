import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';

class CreateProject extends Usecase<ProjectEntity, CreateProjectParams> {
  final ProjectRepository projectRepository;

  CreateProject(this.projectRepository);

  @override
  Future<Either<Failure, ProjectEntity>> call(
      CreateProjectParams params) async {
    return await projectRepository.createProject(
      projectId: params.projectId,
      projectName: params.projectName,
      department: params.department,
      listOfModules: params.listOfModules,
      projectDescription: params.projectDescription,
    );
  }
}

class CreateProjectParams extends Equatable {
  final String projectId;
  final String projectName;
  final String department;
  final List<String> listOfModules;
  final String projectDescription;

  CreateProjectParams(
      {this.projectId,
      this.projectName,
      this.department,
      this.listOfModules,
      this.projectDescription});

  @override
  List<Object> get props => [
        projectId,
        projectName,
        department,
        listOfModules,
        projectDescription,
      ];
}
