// servants_event.dart
part of 'servants_bloc.dart';

abstract class ServantsEvent {}

class LoadServants extends ServantsEvent {}
class AddServant extends ServantsEvent {
  // final ServantEntity servant;
  // AddServant(this.servant);
}
