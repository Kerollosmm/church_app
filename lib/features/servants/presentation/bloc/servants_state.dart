// servants_state.dart
part of 'servants_bloc.dart';

abstract class ServantsState {}

class ServantsInitial extends ServantsState {}
class ServantsLoading extends ServantsState {}
class ServantsLoaded extends ServantsState {
  // final List<ServantEntity> servants;
  // ServantsLoaded(this.servants);
}
class ServantsError extends ServantsState {
  final String message;
  ServantsError(this.message);
}
