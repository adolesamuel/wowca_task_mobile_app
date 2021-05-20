import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, DeptEntity>> createDept({
    String deptDescription,
    String deptName,
  });
  Future<Either<Failure, List<DeptEntity>>> getDept();
//  Future<Either<Failure, CreatedDeptEntity>> deleteDept(deptId);

}
