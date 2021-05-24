import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';

class UpdateModule extends Usecase<ModuleEntity, UpdateModuleParams> {
  final ModuleRepository moduleRepostitory;

  UpdateModule(this.moduleRepostitory);

  @override
  Future<Either<Failure, ModuleEntity>> call(UpdateModuleParams params) async {
    return await moduleRepostitory.updateModule(
      moduleId: params.moduleId,
      moduleName: params.moduleName,
      moduleDescription: params.moduleDescription,
      percentCompletion: params.percentCompletion,
      listOfTasks: params.listOfTasks,
      projectId: params.projectId,
    );
  }
}

class UpdateModuleParams extends Equatable {
  final String moduleId;
  final String moduleName;
  final String moduleDescription;
  final double percentCompletion;
  final List<String> listOfTasks;
  final String projectId;

  UpdateModuleParams({
    this.moduleId,
    this.moduleName,
    this.moduleDescription,
    this.percentCompletion,
    this.listOfTasks,
    this.projectId,
  });

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        moduleDescription,
        percentCompletion,
        listOfTasks,
        projectId,
      ];
}
