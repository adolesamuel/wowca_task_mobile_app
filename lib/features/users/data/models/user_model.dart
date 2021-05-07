import 'dart:io';

import 'package:wowca_task/features/users/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String userId;
  final String userName;
  final String userEmail;
  final File userProfilePicture;
  final List userTasks;
  final List userCompanies;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userProfilePicture,
      this.userTasks,
      this.userCompanies});
}
