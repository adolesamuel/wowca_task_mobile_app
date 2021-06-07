import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/departments/domain/entity/delete_dept_success_entity.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/usecases/create_dept.dart';
import 'package:wowca_task/features/departments/domain/usecases/delete_dept.dart';
import 'package:wowca_task/features/departments/domain/usecases/get_dept.dart';
import 'package:wowca_task/features/departments/domain/usecases/get_one_department.dart';
import 'package:wowca_task/features/departments/domain/usecases/update_dept.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final GetDept getDept;
  final CreateDept createDept;
  final GetOneDept getOneDept;
  final DeleteDept deleteDept;
  final UpdateDept updateDept;

  DepartmentBloc({
    this.getDept,
    this.createDept,
    this.getOneDept,
    this.deleteDept,
    this.updateDept,
  }) : super(DepartmentInitial());

  @override
  Stream<DepartmentState> mapEventToState(
    DepartmentEvent event,
  ) async* {
    if (event is GetDepartmentsEvent) {
      yield DepartmentLoadingState();

      final deptOrError = await getDept(GetDeptParams());

      yield deptOrError.fold((failure) => DepartmentErrorState(failure),
          (listOfDept) => ListOfDepartmentState(listOfDept));
    }

    if (event is CreateDepartmentEvent) {
      yield DepartmentLoadingState();

      final createOrError = await createDept(CreateDeptParams(
        departmentName: event.deptName,
        departmentDescription: event.deptDescription,
      ));

      yield createOrError.fold((failure) => DepartmentErrorState(failure),
          (dept) => CreatedDepartmentState(dept));
    }
    if (event is GetOneDepartmentEvent) {
      yield DepartmentLoadingState();

      final getOneDeptOrError =
          await getOneDept(GetOneDeptParams(event.departmentId));

      yield getOneDeptOrError.fold((failure) => DepartmentErrorState(failure),
          (dept) => ReceivedOneDepartmentState(dept));
    }
    if (event is DeleteDepartmentEvent) {
      yield DepartmentLoadingState();

      final deleteDeptOrError =
          await deleteDept(DeleteDeptParams(event.departmentId));

      yield deleteDeptOrError.fold((failure) => DepartmentErrorState(failure),
          (status) => DeleteDeptSuccessState(status));
    }
  }
}
