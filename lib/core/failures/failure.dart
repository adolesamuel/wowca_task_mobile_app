import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String message;

  Failure(this.title, this.message);

  List<Object> get props => [title, message];
}

class ServerFailure extends Failure {
  final String title;
  final String message;

  ServerFailure(this.title, this.message) : super(title, message);
}

class CacheFailure extends Failure {
  final String title;
  final String message;

  CacheFailure(this.title, this.message) : super(title, message);
}

class CommonFailure extends Failure {
  CommonFailure(final String title, final String message)
      : super(title, message);
}

class InternetFailure extends Failure {
  InternetFailure(final String title, final String message)
      : super(title, message);
}

class AuthenticationFailure extends Failure {
  final String title;
  final String message;

  AuthenticationFailure(this.title, this.message) : super(title, message);
}
