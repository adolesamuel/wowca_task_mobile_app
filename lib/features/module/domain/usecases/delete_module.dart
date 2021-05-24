import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/delete_module_success_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';

class DeleteModule
    extends Usecase<DeleteModuleSuccessEntity, DeleteModuleParams> {
  final ModuleRepository moduleRepository;

  DeleteModule(this.moduleRepository);

  @override
  Future<Either<Failure, DeleteModuleSuccessEntity>> call(
      DeleteModuleParams params) async {
    return await moduleRepository.deleteModule(moduleId: params.moduleId);
  }
}

class DeleteModuleParams extends Equatable {
  final String moduleId;

  DeleteModuleParams(this.moduleId);

  @override
  List<Object> get props => [moduleId];
}
