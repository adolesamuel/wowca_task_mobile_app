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
      companyName: params.companyName,
      companyAddress: params.companyAddress,
      companyDescription: params.companyDescription,
    );
  }
}

class CreateCompanyParams extends Equatable {
  final String companyName;
  final String companyDescription;
  final String companyAddress;

  CreateCompanyParams({
    this.companyName,
    this.companyAddress,
    this.companyDescription,
  });

  @override
  List<Object> get props => [
        companyName,
        companyAddress,
        companyDescription,
      ];
}
