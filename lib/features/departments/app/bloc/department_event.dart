part of 'department_bloc.dart';

abstract class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];
}

class GetDepartmentsEvent extends DepartmentEvent {}

class CreateDepartmentEvent extends DepartmentEvent {
  final String deptName;
  final String deptDescription;

  CreateDepartmentEvent({this.deptName, this.deptDescription});
}

class GetOneDepartmentEvent extends DepartmentEvent {
  final String departmentId;

  GetOneDepartmentEvent(this.departmentId);
}

class DeleteDepartmentEvent extends DepartmentEvent {
  final String departmentId;

  DeleteDepartmentEvent(this.departmentId);
}
