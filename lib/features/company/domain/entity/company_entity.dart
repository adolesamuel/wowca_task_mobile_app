import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CompanyEntity extends Equatable {
  //This company entity will always be used as the
  //default company object in U.i design
  //this model has to be updated to add new features
  // or hold new data for a company

  // An Id for the Company
  final String companyId;

  // A name for Company
  final String companyName;

  // A location description for company
  // upgradeable to a location object
  final String companyAddress;

  //A description of company values and ideals
  final String companyDescription;

  //A file to be used as company logo, expected
  // as a png,jpeg or jpg
  final File companyLogo;

  //A list of Users (ideally a user object) in the company,
  //users have to be in this list
  // in order to be added to company projects
  final List companyUsers;

  //A lis t of departments present in a company,
  // upgrade to a list of deparment objects
  final List department;

  CompanyEntity({
    @required this.companyId,
    @required this.companyName,
    @required this.companyLogo,
    @required this.companyUsers,
    @required this.department,
    @required this.companyAddress,
    @required this.companyDescription,
  });

  @override
  List<Object> get props => [
        companyId,
        companyName,
        companyLogo,
        companyUsers,
        department,
        companyAddress,
        companyDescription,
      ];
}
