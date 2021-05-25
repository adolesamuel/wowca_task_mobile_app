import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/module/domain/entity/delete_module_success_entity.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';

abstract class ModuleRepository {
  Future<Either<Failure, ModuleEntity>> createModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    String moduleDescription,
    List<String> listOfTasks,
    String projectId,
  });

  Future<Either<Failure, List<ModuleEntity>>> getModules();

  Future<Either<Failure, ModuleEntity>> updateModule({
    String moduleId,
    String moduleName,
    double percentCompletion,
    String moduleDescription,
    List<String> listOfTasks,
    String projectId,
  });

  Future<Either<Failure, ModuleEntity>> getOneModule({String moduleId});
  Future<Either<Failure, DeleteModuleSuccessEntity>> deleteModule(
      {String moduleId});
}
