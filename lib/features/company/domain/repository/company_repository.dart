import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';
import 'package:wowca_task/features/company/domain/entity/delete_success_entity.dart';

abstract class CompanyRepository {
  Future<Either<Failure, CompanyEntity>> createCompany({
    String companyId,
    String companyName,
    File companyLogo,
    List companyUsers,
    List department,
    String companyDescription,
    String companyAddress,
  });

  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
  Future<Either<Failure, CompanyEntity>> getOneCompany(
      {@required String companyId});

  Future<Either<Failure, DeleteSuccessEntity>> deleteCompany(
      {@required String id});

  Future<Either<Failure, CompanyEntity>> updateCompany({
    @required companyId,
    companyName,
    companyLogo,
    companyUsers,
    department,
    companyAddress,
    companyDescription,
    owner,
  });
}
