/// Base class for all server exceptions in the application.
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    this.message = 'An error occurred on the server.',
    this.statusCode,
  });

  @override
  String toString() => 'ServerException: $message (Status: $statusCode)';
}

/// Exception thrown when there is no internet connection.
class NetworkException implements Exception {
  final String message;

  const NetworkException({
    this.message = 'No internet connection. Please check your network settings.',
  });

  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown when cache operations fail.
class CacheException implements Exception {
  final String message;

  const CacheException({
    this.message = 'An error occurred while accessing local storage.',
  });

  @override
  String toString() => 'CacheException: $message';
}

/// Exception thrown when validation fails.
class ValidationException implements Exception {
  final String message;

  const ValidationException({
    this.message = 'Validation failed.',
  });

  @override
  String toString() => 'ValidationException: $message';
}
