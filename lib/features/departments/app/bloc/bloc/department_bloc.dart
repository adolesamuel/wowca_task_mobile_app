import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    if (event is GetDeparmentsEvent) {
      yield DepartmentLoadingState();
    }
  }
}
