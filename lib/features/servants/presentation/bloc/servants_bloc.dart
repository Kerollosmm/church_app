// servants_bloc.dart
//
// PURPOSE:
// State management for Servants list.

import 'package:flutter_bloc/flutter_bloc.dart';

part 'servants_event.dart';
part 'servants_state.dart';

class ServantsBloc extends Bloc<ServantsEvent, ServantsState> {
  ServantsBloc() : super(ServantsInitial()) {
    on<LoadServants>((event, emit) {
      // TODO: Call GetServantsUseCase
    });

    on<AddServant>((event, emit) {
      // TODO: Call AddServantUseCase
    });
  }
}
