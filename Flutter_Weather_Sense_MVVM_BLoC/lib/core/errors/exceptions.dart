import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  /// Describe what caused the [ServerException] was thrown.
  final String? message;

  const ServerException({
    this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class CacheException extends Equatable implements Exception {
  /// Describe what caused the [CacheException] was thrown.
  final String? message;

  const CacheException({
    this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class UnexpectedException extends Equatable implements Exception {
  /// Describe what caused the [UnexpectedException] was thrown.
  final String? message;

  const UnexpectedException({
    this.message,
  });

  /// The list of properties that will be used to determine whether two instances are equal.
  @override
  List<Object?> get props => [message];

  /// Implement [toString] method including all the given props
  /// by changing the [stringify] value into [true]
  @override
  bool get stringify => true;
}
