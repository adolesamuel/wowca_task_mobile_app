import 'package:equatable/equatable.dart';

class SignedInUserEntity extends Equatable {
  final String name;
  final String userId;
  final String orgName;
  final String role;
  final String token;
  final String email;
  final String activated;
  SignedInUserEntity({
    this.name,
    this.userId,
    this.orgName,
    this.role,
    this.token,
    this.email,
    this.activated,
  }) : super();

  @override
  List<Object> get props => [
        name,
        userId,
        orgName,
        role,
        token,
        email,
        activated,
      ];
}
