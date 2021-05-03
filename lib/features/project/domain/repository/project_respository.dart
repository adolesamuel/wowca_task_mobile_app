import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/project/domain/entity/project_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, ProjectEntity>> createProject({
    String projectId,
    String projectName,
    String department,
    List<ModuleEntity> listOfModules,
  });

  Future<Either<Failure, List<ProjectEntity>>> getProject();
}
