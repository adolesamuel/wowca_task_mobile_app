import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/module/domain/entity/module_entity.dart';
import 'package:wowca_task/features/module/domain/repository/module_repository.dart';

class GetModule extends Usecase<List<ModuleEntity>, GetModuleParams> {
  final ModuleRepository moduleRepository;

  GetModule(this.moduleRepository);

  @override
  Future<Either<Failure, List<ModuleEntity>>> call(
      GetModuleParams params) async {
    return await moduleRepository.getModule();
  }
}

class GetModuleParams extends Equatable {
  GetModuleParams();

  @override
  List<Object> get props => [];
}
