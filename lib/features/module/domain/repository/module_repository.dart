import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

abstract class ModuleRepository {
  Future<Either<Failure, ModuleEntity>> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    List<GetTaskEntity> listOfTasks,
    String projectName,
  });

  Future<Either<Failure, List<ModuleEntity>>> getModule();
}
