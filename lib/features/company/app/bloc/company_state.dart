part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoadingState extends CompanyState {}

class CompanyErrorState extends CompanyState {
  final Failure failure;

  CompanyErrorState(this.failure);
}

class CompaniesRecievedState extends CompanyState {
  final List<CompanyEntity> companies;

  CompaniesRecievedState(this.companies);
}
