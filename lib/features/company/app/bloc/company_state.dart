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

class CompanyCreatedState extends CompanyState {
  final CompanyEntity company;

  CompanyCreatedState(this.company);
}

class CompanyReceivedState extends CompanyState {
  final CompanyEntity company;

  CompanyReceivedState(this.company);
}

class DeleteCompanySuccessState extends CompanyState {
  final DeleteCompSuccessEntity status;

  DeleteCompanySuccessState(this.status);
}

class UpdateCompanyState extends CompanyState {
  final String status;

  UpdateCompanyState(this.status);
}
