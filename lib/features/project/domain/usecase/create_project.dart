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
      projectName: params.projectName,
      department: params.department,
      projectDescription: params.projectDescription,
    );
  }
}

class CreateProjectParams extends Equatable {
  final String projectName;
  final String department;
  final String projectDescription;

  CreateProjectParams(
      {this.projectName, this.department, this.projectDescription});

  @override
  List<Object> get props => [
        projectName,
        department,
        projectDescription,
      ];
}
