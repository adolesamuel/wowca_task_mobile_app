part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class GetCompaniesEvent extends CompanyEvent {}

class CreateCompanyEvent extends CompanyEvent {
  final String companyId;
  final String companyName;
  final String companyLogo;
  final List companyUsers;
  final List department;
  final String companyDescription;
  final String companyAddress;

  CreateCompanyEvent({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.companyUsers,
    this.department,
    this.companyDescription,
    this.companyAddress,
  });
}

class GetOneCompanyEvent extends CompanyEvent {
  final String companyId;

  GetOneCompanyEvent(this.companyId);
}

class DeleteCompanyEvent extends CompanyEvent {
  final String companyId;

  DeleteCompanyEvent(this.companyId);
}

class UpdateCompanyEvent extends CompanyEvent {
  final String companyId;
  final String companyName;
  final String companyLogo;
  final List companyUsers;
  final List department;
  final String companyDescription;
  final String companyAddress;
  final String owner;

  UpdateCompanyEvent({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.companyUsers,
    this.department,
    this.companyDescription,
    this.companyAddress,
    this.owner,
  });
}
