part of 'department_bloc.dart';

abstract class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoadingState extends DepartmentState {}

class DepartmentErrorState extends DepartmentState {
  final Failure failure;

  DepartmentErrorState(this.failure);
}

class ListOfDepartmentState extends DepartmentState {
  final List<DeptEntity> listOfDept;

  ListOfDepartmentState(this.listOfDept);
}

class CreatedDepartmentState extends DepartmentState {
  final DeptEntity dept;

  CreatedDepartmentState(this.dept);
}

class ReceivedOneDepartmentState extends DepartmentState {
  final DeptEntity dept;

  ReceivedOneDepartmentState(this.dept);
}

class DeleteDeptSuccessState extends DepartmentState {
  final DeleteDeptSuccessEntity status;

  DeleteDeptSuccessState(this.status);
}
