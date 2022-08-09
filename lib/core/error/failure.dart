import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message, this.code});
  final String? message;
  final int? code;
  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: 'Server error', code: 500);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: 'Bad request', code: 400);
}

class CacheFailure extends Failure {
  const CacheFailure() : super(message: 'Cache error');
}
