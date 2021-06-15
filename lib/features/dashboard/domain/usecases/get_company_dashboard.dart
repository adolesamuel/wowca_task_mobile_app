import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/usecase/usecase.dart';
import 'package:wowca_task/features/dashboard/domain/entity/company_dashboard_entity.dart';
import 'package:wowca_task/features/dashboard/domain/repository/dashboard_repository.dart';

class GetCompanyDashBoard
    extends Usecase<CompanyDashBoardEntity, CompanyDashBoardParams> {
  final DashBoardRepository dashBoardRepository;

  GetCompanyDashBoard(this.dashBoardRepository);

  @override
  Future<Either<Failure, CompanyDashBoardEntity>> call(params) {
    throw UnimplementedError();
  }
}

class CompanyDashBoardParams extends Equatable {
  @override
  List<Object> get props => [];
}
