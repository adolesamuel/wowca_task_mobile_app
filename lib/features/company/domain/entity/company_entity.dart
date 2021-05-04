import 'dart:io';

import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final String companyId;
  final String companyName;
  final File companyLogo;
  final List companyUsers;
  final List department;

  CompanyEntity({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.companyUsers,
    this.department,
  });

  @override
  List<Object> get props => [
        companyId,
        companyName,
        companyLogo,
        companyUsers,
        department,
      ];
}
