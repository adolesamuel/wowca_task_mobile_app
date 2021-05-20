import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/company/domain/entity/delete_success_entity.dart';
import 'package:wowca_task/features/company/domain/repository/company_repository.dart';

class DeleteCompany extends Usecase<DeleteSuccessEntity, DeleteCompanyParams> {
  final CompanyRepository companyRepository;

  DeleteCompany(this.companyRepository);

  @override
  Future<Either<Failure, DeleteSuccessEntity>> call(
      DeleteCompanyParams params) async {
    return await companyRepository.deleteCompany(id: params.id);
  }
}

class DeleteCompanyParams extends Equatable {
  final String id;

  DeleteCompanyParams(this.id);

  @override
  List<Object> get props => [id];
}
