import 'package:equatable/equatable.dart';

class RegisteredUser extends Equatable {
  final String token;

  RegisteredUser(this.token);

  @override
  List<Object> get props => [token];
}
