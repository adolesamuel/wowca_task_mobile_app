import 'package:wowca_task/features/user_registration/domain/entity/signed_in_user.dart';

class SignedInUserModel extends SignedInUserEntity {
  final String name;
  final String userId;

  final String role;
  final String token;
  final String email;
  final String activated;

  SignedInUserModel({
    this.name,
    this.userId,
    this.role,
    this.token,
    this.email,
    this.activated,
  }) : super(
          name: name,
          userId: userId,
          role: role,
          token: token,
          email: email,
          activated: activated,
        );

  factory SignedInUserModel.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return SignedInUserModel();
    } else {
      return SignedInUserModel(
        name: data['name'],
        userId: data['_id'],
        role: data['role'],
        token: data['a_token'],
        email: data['email'],
        activated: data['active'].toString(),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      'role': role,
      'token': token,
      'email': email,
      'activated': activated,
    };
  }
}
