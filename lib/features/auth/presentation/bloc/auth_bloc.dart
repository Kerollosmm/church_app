// auth_bloc.dart
//
// PURPOSE:
// Manages the state of Authentication (Uninitialized, Authenticated, Unauthenticated, Loading, Error).
// Listens to AuthEvents (LoginRequested, LogoutRequested, AppStarted).

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) {
      // TODO: Check auth status
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      // TODO: Call LoginUseCase
    });

    on<LogoutRequested>((event, emit) {
      // TODO: Call LogoutUseCase
    });
  }
}
