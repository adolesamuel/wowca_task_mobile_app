import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';

class CreateCompany extends Usecase<CompanyEntity, CreateCompanyParams> {
  final CompanyRepository companyRepository;

  CreateCompany(this.companyRepository);

  @override
  Future<Either<Failure, CompanyEntity>> call(
      CreateCompanyParams params) async {
    return await companyRepository.createCompany(
      companyId: params.companyId,
      companyName: params.companyName,
      companyLogo: params.companyLogo,
      companyUsers: params.companyUsers,
      department: params.department,
    );
  }
}

class CreateCompanyParams extends Equatable {
  final String companyId;
  final String companyName;
  final File companyLogo;
  final List companyUsers;
  final List department;
  final String companyDescription;
  final String companyAddress;

  CreateCompanyParams({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.companyUsers,
    this.department,
    this.companyAddress,
    this.companyDescription,
  });

  @override
  List<Object> get props => [
        companyId,
        companyName,
        companyLogo,
        companyUsers,
        department,
        companyAddress,
        companyDescription,
      ];
}
