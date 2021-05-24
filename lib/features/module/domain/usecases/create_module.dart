import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';

class CreateModule extends Usecase<ModuleEntity, CreateModuleParams> {
  final ModuleRepository moduleRepository;

  CreateModule(this.moduleRepository);
  @override
  Future<Either<Failure, ModuleEntity>> call(CreateModuleParams params) async {
    return await moduleRepository.createModule(
      moduleId: params.moduleId,
      moduleName: params.moduleName,
      percentCompletion: params.percentCompletion,
      listOfTasks: params.listOfTasks,
      projectId: params.projectId,
    );
  }
}

class CreateModuleParams extends Equatable {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<String> listOfTasks;
  final String projectId;

  CreateModuleParams({
    this.moduleId,
    this.moduleName,
    this.percentCompletion,
    this.listOfTasks,
    this.projectId,
  });

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        percentCompletion,
        listOfTasks,
        projectId,
      ];
}
