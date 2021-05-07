import 'dart:io';

import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

class CompanyModel extends CompanyEntity {
  final String companyId;
  final String companyName;
  final String companyAddress;
  final String companyDescription;
  final File companyLogo;
  final List companyUsers;
  final List department;

  CompanyModel(
      {this.companyId,
      this.companyName,
      this.companyAddress,
      this.companyDescription,
      this.companyLogo,
      this.companyUsers,
      this.department})
      : super(
          companyName: companyName,
          companyId: companyId,
          companyAddress: companyAddress,
          companyDescription: companyDescription,
          companyLogo: companyLogo,
          companyUsers: companyUsers,
          department: department,
        );
}
