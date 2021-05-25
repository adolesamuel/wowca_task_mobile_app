import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';

class GetOneCompany extends Usecase<CompanyEntity, GetOneCompanyParams> {
  final CompanyRepository companyRepository;

  GetOneCompany(this.companyRepository);

  @override
  Future<Either<Failure, CompanyEntity>> call(
      GetOneCompanyParams params) async {
    return await companyRepository.getOneCompany(companyId: params.companyId);
  }
}

class GetOneCompanyParams extends Equatable {
  final String companyId;

  GetOneCompanyParams(this.companyId);
  @override
  List<Object> get props => [companyId];
}
