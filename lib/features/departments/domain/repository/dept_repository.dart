import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/departments/domain/entity/delete_dept_success_entity.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, DeptEntity>> createDept({
    String deptDescription,
    String deptName,
  });
  Future<Either<Failure, DeptEntity>> updateDept({
    String departmentDescription,
    String departmentId,
    String departmentName,
    List<String> listofUsers,
    List<String> listofProject,
    String companyId,
  });
  Future<Either<Failure, List<DeptEntity>>> getDept();
  Future<Either<Failure, DeptEntity>> getOneDept({String deptId});
  Future<Either<Failure, DeleteDeptSuccessEntity>> deleteDept({String deptId});
}
