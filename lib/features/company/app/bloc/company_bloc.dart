import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/usecases/create_company.dart';
import 'package:wowca_task/features/company/domain/usecases/delete_company.dart';
import 'package:wowca_task/features/company/domain/usecases/get_company.dart';
import 'package:wowca_task/features/company/domain/usecases/get_one_company.dart';
import 'package:wowca_task/features/company/domain/usecases/update_company.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CreateCompany createCompany;
  final GetCompanies getCompanies;
  final GetOneCompany getOneCompany;
  final DeleteCompany deleteCompany;
  final UpdateCompany updateCompany;

  CompanyBloc(
      {this.getOneCompany,
      this.deleteCompany,
      this.updateCompany,
      this.createCompany,
      this.getCompanies})
      : super(CompanyInitial());

  @override
  Stream<CompanyState> mapEventToState(
    CompanyEvent event,
  ) async* {
    if (event is GetCompaniesEvent) {
      yield CompanyLoadingState();

      final getCompaniesOrError = await getCompanies(GetCompanyParams());

      yield getCompaniesOrError.fold((failure) => CompanyErrorState(failure),
          (companies) => CompaniesRecievedState(companies));
    }
  }
}
