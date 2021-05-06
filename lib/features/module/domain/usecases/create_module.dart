import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';
import 'package:wowca_task/features/task/domain/entities/get_task_entity.dart';

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
      projectName: params.projectName,
    );
  }
}

class CreateModuleParams extends Equatable {
  final String moduleId;
  final String moduleName;
  final double percentCompletion;
  final List<GetTaskEntity> listOfTasks;
  final String projectName;

  CreateModuleParams({
    this.moduleId,
    this.moduleName,
    this.percentCompletion,
    this.listOfTasks,
    this.projectName,
  });

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        percentCompletion,
        listOfTasks,
        projectName,
      ];
}
