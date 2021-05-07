import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';

class GetDept extends Usecase<List<DeptEntity>, GetDeptParams> {
  final DepartmentRepository departmentRepository;

  GetDept(this.departmentRepository);

  @override
  Future<Either<Failure, List<DeptEntity>>> call(GetDeptParams params) async {
    return await departmentRepository.getDept();
  }
}

class GetDeptParams extends Equatable {
  GetDeptParams();

  @override
  List<Object> get props => [];
}
