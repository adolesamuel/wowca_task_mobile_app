import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/repository/dept_repository.dart';

class UpdateDept extends Usecase<DeptEntity, UpdateDeptParams> {
  final DepartmentRepository _departmentRepository;

  UpdateDept(this._departmentRepository);

  @override
  Future<Either<Failure, DeptEntity>> call(UpdateDeptParams params) async {
    return await _departmentRepository.updateDept(
      departmentDescription: params.departmentDescription,
      departmentId: params.departmentId,
      departmentName: params.departmentName,
      listofUsers: params.listofUsers,
      listofProject: params.listofProject,
      companyId: params.companyId,
    );
  }
}

class UpdateDeptParams extends Equatable {
  final String departmentDescription;
  final String departmentId;
  final String departmentName;
  final List<String> listofUsers;
  final List<String> listofProject;
  final String companyId;

  UpdateDeptParams(
    this.departmentDescription,
    this.departmentId,
    this.departmentName,
    this.listofUsers,
    this.listofProject,
    this.companyId,
  );

  @override
  List<Object> get props => [
        departmentDescription,
        departmentId,
        departmentName,
        listofUsers,
        listofProject,
        companyId,
      ];
}
