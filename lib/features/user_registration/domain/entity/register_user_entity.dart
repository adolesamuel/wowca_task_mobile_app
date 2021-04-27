import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  final String name;
  final String password;
  final String email;
  final String orgName;

  RegisterUserEntity(this.name, this.password, this.email, this.orgName);

  @override
  List<Object> get props => [
        name,
        password,
        email,
        orgName,
      ];
}
