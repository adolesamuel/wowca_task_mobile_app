import 'package:equatable/equatable.dart';

class RegisteredUserEntity extends Equatable {
  final String token;

  RegisteredUserEntity(this.token);

  @override
  List<Object> get props => [token];
}
