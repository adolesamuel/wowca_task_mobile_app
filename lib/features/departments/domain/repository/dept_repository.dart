import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/departments/domain/entity/created_dept_entity.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, CreatedDeptEntity>> createDept({
    String userId,
    String userRole,
    String deptName,
  });
//  Future<Either<Failure, CreatedDeptEntity>> getDept();
//  Future<Either<Failure, CreatedDeptEntity>> deleteDept(deptId);

}
