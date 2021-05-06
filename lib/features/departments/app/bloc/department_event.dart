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
