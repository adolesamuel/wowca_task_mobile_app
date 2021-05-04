import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wowca_task/core/failures/failure.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

abstract class CompanyRepository {
  Future<Either<Failure, CompanyEntity>> createCompany({
    final String companyId,
    final String companyName,
    final File companyLogo,
    final List companyUsers,
    final List department,
  });

  Future<Either<Failure, List<CompanyEntity>>> getCompany();
}
