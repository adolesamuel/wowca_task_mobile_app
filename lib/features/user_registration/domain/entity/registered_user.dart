import 'package:equatable/equatable.dart';

class RegisteredUserEntity extends Equatable {
  final String title;
  final String message;
  final String status;

  RegisteredUserEntity({
    this.title,
    this.message,
    this.status,
  });

  @override
  List<Object> get props => [
        title,
        message,
        status,
      ];
}
