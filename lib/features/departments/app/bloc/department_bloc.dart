import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/departments/domain/entity/created_dept_entity.dart';
import 'package:wowca_task/features/departments/domain/entity/department_entity.dart';
import 'package:wowca_task/features/departments/domain/usecases/create_dept.dart';
import 'package:wowca_task/features/departments/domain/usecases/get_dept.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final GetDept getDept;
  final CreateDept createDept;

  DepartmentBloc(this.getDept, this.createDept) : super(DepartmentInitial());

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
  }
}
