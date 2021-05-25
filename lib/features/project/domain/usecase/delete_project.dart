import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/project/domain/entity/delete_project_success_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';

class DeleteProject
    extends Usecase<DeleteProjectSuccessEntity, DeleteProjectParams> {
  final ProjectRepository projectRepository;

  DeleteProject(this.projectRepository);

  @override
  Future<Either<Failure, DeleteProjectSuccessEntity>> call(
      DeleteProjectParams params) async {
    return await projectRepository.deleteProject(projectId: params.projectId);
  }
}

class DeleteProjectParams extends Equatable {
  final String projectId;

  DeleteProjectParams(this.projectId);

  @override
  List<Object> get props => [projectId];
}
