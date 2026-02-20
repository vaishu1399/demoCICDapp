import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
/// Failures represent errors that occur during business logic operations.
abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

/// Failure that occurs when the server returns an error.
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'An error occurred on the server.',
    super.code,
  });
}

/// Failure that occurs when there is no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message =
        'No internet connection. Please check your network settings.',
  });
}

/// Failure that occurs during cache operations.
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'An error occurred while accessing local storage.',
  });
}

/// Failure that occurs during validation.
class ValidationFailure extends Failure {
  const ValidationFailure({super.message = 'Validation failed.'});
}

/// Failure for unknown or unexpected errors.
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred. Please try again.',
  });
}
