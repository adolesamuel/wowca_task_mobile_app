import 'package:wowca_task/features/user_registration/domain/entity/registered_user.dart';

class RegisteredUserModel extends RegisteredUserEntity {
  final String token;

  RegisteredUserModel(this.token) : super(token);

  factory RegisteredUserModel.fromJson(Map<String, dynamic> json) {
    final data = json['response'];

    return RegisteredUserModel(data);
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
    };
  }

  @override
  List<Object> get props => [token];
}
