import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';

class UpdateCompany extends Usecase<CompanyEntity, UpdateCompanyParams> {
  final CompanyRepository companyRepository;

  UpdateCompany(this.companyRepository);
  @override
  Future<Either<Failure, CompanyEntity>> call(
      UpdateCompanyParams params) async {
    return companyRepository.updateCompany(
      companyId: params.companyId,
      companyName: params.companyName,
      companyLogo: params.companyLogo,
      companyUsers: params.companyUsers,
      department: params.department,
      companyAddress: params.companyAddress,
      companyDescription: params.companyDescription,
      owner: params.owner,
    );
  }
}

class UpdateCompanyParams extends Equatable {
  final String companyId, companyName, companyLogo;
  final List companyUsers, department;
  final String companyAddress, companyDescription, owner;

  UpdateCompanyParams(
      this.companyId,
      this.companyName,
      this.companyLogo,
      this.companyUsers,
      this.department,
      this.companyAddress,
      this.companyDescription,
      this.owner);

  @override
  List<Object> get props => [
        companyId,
        companyName,
        companyLogo,
        companyUsers,
        department,
        companyAddress,
        companyDescription,
        owner,
      ];
}
