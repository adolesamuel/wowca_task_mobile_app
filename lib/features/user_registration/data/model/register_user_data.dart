import 'package:wowca_task/features/user_registration/domain/entity/register_user_entity.dart';

class RegisterUserModel extends RegisterUserEntity {
  final String name;
  final String password;
  final String email;
  final String orgName;

  RegisterUserModel({this.name, this.password, this.email, this.orgName})
      : super(
          name,
          password,
          email,
          orgName,
        );

  @override
  List<Object> get props => [
        name,
        password,
        email,
        orgName,
      ];
}
