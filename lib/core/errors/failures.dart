// failures.dart
//
// PURPOSE:
// Defines core failure classes that are returned by Repositories to the Domain layer.
// This decouples the Domain layer from specific exceptions thrown by Data sources.
//
// USAGE:
// Return `Left(Failure)` from Repository methods using `Either<Failure, Type>`.

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}
