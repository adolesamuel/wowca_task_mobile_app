import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';
import 'package:wowca_task/features/project/domain/repository/project_respository.dart';

class GetProject extends Usecase<List<ProjectEntity>, GetProjectParams> {
  final ProjectRepository projectRepository;

  GetProject(this.projectRepository);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(
      GetProjectParams params) async {
    return await projectRepository.getProject();
  }
}

class GetProjectParams extends Equatable {
  GetProjectParams();

  @override
  List<Object> get props => [];
}
