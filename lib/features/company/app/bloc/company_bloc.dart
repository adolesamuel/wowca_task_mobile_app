import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wowca_task/features/company/domain/usecases/create_company.dart';
import 'package:wowca_task/features/company/domain/usecases/get_company.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CreateCompany createCompany;
  final GetCompanies getCompanies;

  CompanyBloc({this.createCompany, this.getCompanies})
      : super(CompanyInitial());

  @override
  Stream<CompanyState> mapEventToState(
    CompanyEvent event,
  ) async* {}
}
