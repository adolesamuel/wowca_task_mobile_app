import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';

class GetCompany extends Usecase<List<CompanyEntity>, GetCompanyParams> {
  final CompanyRepository companyRepository;

  GetCompany(this.companyRepository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(
      GetCompanyParams params) async {
    return await companyRepository.getCompany();
  }
}

class GetCompanyParams extends Equatable {
  @override
  List<Object> get props => [];
}
