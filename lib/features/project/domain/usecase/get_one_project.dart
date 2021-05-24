import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';

class GetOneProject extends Usecase<ProjectEntity, GetOneProjectParams> {
  final ProjectRepository projectRepository;

  GetOneProject(this.projectRepository);

  @override
  Future<Either<Failure, ProjectEntity>> call(
      GetOneProjectParams params) async {
    return await projectRepository.getOneProject(projectId: params.projectId);
  }
}

class GetOneProjectParams extends Equatable {
  final String projectId;

  GetOneProjectParams(this.projectId);

  @override
  List<Object> get props => [projectId];
}
