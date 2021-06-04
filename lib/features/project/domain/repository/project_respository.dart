import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/project/domain/entity/delete_project_success_entity.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, ProjectEntity>> createProject({
    String projectName,
    String department,
    String projectDescription,
  });

  Future<Either<Failure, ProjectEntity>> updateProject({
    String projectId,
    String projectName,
    List<String> listOfModules,
    String department,
    String projectDescription,
  });

  Future<Either<Failure, List<ProjectEntity>>> getProjects();
  Future<Either<Failure, ProjectEntity>> getOneProject({String projectId});
  Future<Either<Failure, DeleteProjectSuccessEntity>> deleteProject(
      {String projectId});
}
