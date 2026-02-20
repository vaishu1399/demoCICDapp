import 'package:equatable/equatable.dart';

/// A generic class that represents the state of an asynchronous operation.
/// This is used throughout the presentation layer to handle loading,
/// success, and error states in a consistent manner.
sealed class State<Success, Failure> extends Equatable {
  const State();

  /// Returns true if the state is currently loading.
  bool get isLoading => this is StateLoading;

  /// Returns true if the state is a success state with data.
  bool get isSuccess => this is StateSuccess;

  /// Returns true if the state is an error state.
  bool get isError => this is StateError;

  /// Returns the success data if available.
  Success? get successOrNull {
    if (this is StateSuccess) {
      return (this as StateSuccess).data;
    }
    return null;
  }

  /// Returns the failure if available.
  Failure? get failureOrNull {
    if (this is StateError) {
      return (this as StateError).failure;
    }
    return null;
  }
}

/// Initial state before any operation is performed.
class StateInitial<Success, Failure> extends State<Success, Failure> {
  const StateInitial();

  @override
  List<Object?> get props => [];
}

/// State indicating that an operation is in progress.
class StateLoading<Success, Failure> extends State<Success, Failure> {
  final Success? previousData;

  const StateLoading({this.previousData});

  @override
  List<Object?> get props => [previousData];
}

/// State indicating that the operation completed successfully.
class StateSuccess<Success, Failure> extends State<Success, Failure> {
  final Success data;

  const StateSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

/// State indicating that the operation failed.
class StateError<Success, Failure> extends State<Success, Failure> {
  final Failure failure;

  const StateError(this.failure);

  @override
  List<Object?> get props => [failure];
}
