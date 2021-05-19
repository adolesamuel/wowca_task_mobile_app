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
  final String owner;

  CompanyModel(
      {this.companyId,
      this.companyName,
      this.companyAddress,
      this.companyDescription,
      this.companyLogo,
      this.companyUsers,
      this.owner,
      this.department})
      : super(
          companyName: companyName,
          companyId: companyId,
          companyAddress: companyAddress,
          companyDescription: companyDescription,
          companyLogo: companyLogo,
          companyUsers: companyUsers,
          department: department,
          owner: owner,
        );

  factory CompanyModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return CompanyModel();
    } else {
      return CompanyModel(
        companyId: data['_id'],
        companyName: data['company_name'],
        companyAddress: data['company_address'],
        companyDescription: data['company_desc'],
        //Company logo not supported yet
        //companyLogo: ,
        companyUsers: data['members'],
        department: data['departments'],
        owner: data['owner'],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'company_name': companyName,
      '_id': companyId,
      'company_address': companyAddress,
      'company_desc': companyDescription,
      'companyLogo': companyLogo,
      'members': companyUsers,
      'departments': department,
      'owner': owner
    };
  }
}
