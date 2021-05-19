import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String userEmail;
  final File userProfilePicture;
  final List userTasks;
  final List userCompanies;
  final String userDepartment;

  UserEntity(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userProfilePicture,
      this.userTasks,
      this.userDepartment,
      this.userCompanies});

  @override
  List<Object> get props => [
        userId,
        userName,
        userEmail,
        userProfilePicture,
        userTasks,
        userCompanies,
      ];
}
