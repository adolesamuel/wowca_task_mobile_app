import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/departments/domain/entity/delete_dept_success_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';

class DeleteDept extends Usecase<DeleteDeptSuccessEntity, DeleteDeptParams> {
  final DepartmentRepository _departmentRepository;

  DeleteDept(this._departmentRepository);

  @override
  Future<Either<Failure, DeleteDeptSuccessEntity>> call(
      DeleteDeptParams params) async {
    return await _departmentRepository.deleteDept(deptId: params.deptId);
  }
}

class DeleteDeptParams extends Equatable {
  final String deptId;

  DeleteDeptParams(this.deptId);

  @override
  List<Object> get props => [deptId];
}
