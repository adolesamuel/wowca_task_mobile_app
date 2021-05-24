import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';

class GetOneProject extends Usecase<ModuleEntity, GetOneModuleParams> {
  final ModuleRepository moduleRepository;

  GetOneProject(this.moduleRepository);

  @override
  Future<Either<Failure, ModuleEntity>> call(GetOneModuleParams params) async {
    return await moduleRepository.getOneModule(moduleId: params.moduleId);
  }
}

class GetOneModuleParams extends Equatable {
  final String moduleId;

  GetOneModuleParams(this.moduleId);

  @override
  List<Object> get props => [moduleId];
}
