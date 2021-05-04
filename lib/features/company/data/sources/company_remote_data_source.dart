import 'dart:io';

import 'package:http/http.dart';
import 'package:wowca_task/core/helpers/json_checker.dart';
import 'package:wowca_task/features/company/data/models/company_model.dart';

abstract class CompanyRemoteDataSource {
  Future<CompanyModel> createCompany({
    String companyId,
    String companyName,
    String companyAddress,
    String companyDescription,
    File companyLogo,
    List companyUsers,
    List department,
  });

  Future<List<CompanyModel>> getCompany();
}

class CompanyDataSourceRemoteImpl implements CompanyRemoteDataSource {
  final Client client;
  final JsonChecker jsonChecker;

  CompanyDataSourceRemoteImpl(this.client, this.jsonChecker);

  @override
  Future<CompanyModel> createCompany({
    String companyId,
    String companyName,
    String companyAddress,
    String companyDescription,
    File companyLogo,
    List companyUsers,
    List department,
  }) async {}

  @override
  Future<List<CompanyModel>> getCompany() {}
}
