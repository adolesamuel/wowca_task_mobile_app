import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';

class GetOneDept extends Usecase<DeptEntity, GetOneDeptParams> {
  final DepartmentRepository _departmentRepository;

  GetOneDept(this._departmentRepository);

  @override
  Future<Either<Failure, DeptEntity>> call(GetOneDeptParams params) async {
    return await _departmentRepository.getOneDept(deptId: params.deptId);
  }
}

class GetOneDeptParams extends Equatable {
  final String deptId;

  GetOneDeptParams(this.deptId);

  @override
  List<Object> get props => [deptId];
}
