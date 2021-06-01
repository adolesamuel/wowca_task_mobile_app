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
      moduleName: params.moduleName,
      moduleDescription: params.moduleDescription,
    );
  }
}

class CreateModuleParams extends Equatable {
  final String moduleId;
  final String moduleName;
  final String moduleDescription;

  CreateModuleParams({
    this.moduleId,
    this.moduleName,
    this.moduleDescription,
  });

  @override
  List<Object> get props => [
        moduleId,
        moduleName,
        moduleDescription,
      ];
}
