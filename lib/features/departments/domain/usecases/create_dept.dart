import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';

class CreateDept extends Usecase<DeptEntity, CreateDeptParams> {
  final DepartmentRepository _departmentRepository;

  CreateDept(this._departmentRepository);

  @override
  Future<Either<Failure, DeptEntity>> call(CreateDeptParams params) async {
    return await _departmentRepository.createDept(
      deptDescription: params.departmentDescription,
      deptName: params.departmentName,
    );
  }
}

class CreateDeptParams extends Equatable {
  final String departmentDescription;
  final String departmentName;

  CreateDeptParams({
    this.departmentDescription,
    this.departmentName,
  });

  @override
  List<Object> get props => [
        departmentDescription,
        departmentName,
      ];
}
