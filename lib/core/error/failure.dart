import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class DatabaseFailure extends Failure {}

class LocalFailure extends Failure {
  final String message;
  LocalFailure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures

class NetworkFailure extends Failure {}

// 400
class ExceptionFailure extends Failure {}

class CredentialFailure extends Failure {}

class AuthenticationFailure extends Failure {}

// 404
class NotFoundFailure extends Failure {
  final String message;
  NotFoundFailure(this.message);

  @override
  List<Object> get props => [message];
}

// 401
class UnauthorizedFailure extends Failure {
  final String message;
  UnauthorizedFailure(this.message);

  @override
  List<Object> get props => [message];
}

// 500
class InternalServerErrorFailure extends Failure {
  final String message;
  InternalServerErrorFailure(this.message);

  @override
  List<Object> get props => [message];
}
