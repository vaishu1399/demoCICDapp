/// UseCase base class for Clean Architecture.
/// This is an abstract class that all use cases should extend.
/// It takes a type for the return value and a type for the parameters.
abstract class UseCase<T, Params> {
  /// Executes the use case with the given parameters.
  Future<T> call(Params params);
}

/// Class to be used when a use case doesn't need any parameters.
class NoParams {
  const NoParams();
}
