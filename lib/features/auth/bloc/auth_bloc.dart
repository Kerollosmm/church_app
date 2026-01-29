import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/models/app_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthBloc(this._firebaseAuth, this._firestore) : super(const AuthState.initial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckRequested(AuthCheckRequested event, Emitter<AuthState> emit) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await _loadUser(user.uid, emit);
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final creds = await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (creds.user != null) {
        await _loadUser(creds.user!.uid, emit);
      } else {
        emit(const AuthState.error('Login failed'));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await _firebaseAuth.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _loadUser(String uid, Emitter<AuthState> emit) async {
    try {
        // AppUser is stored in 'users' collection
        final doc = await _firestore.collection('users').doc(uid).get();
        if (doc.exists) {
            final appUser = AppUser.fromJson(doc.data()!);
            emit(AuthState.authenticated(appUser));
        } else {
            // User authenticated in Firebase but no AppUser record?
            emit(const AuthState.error('User profile not found'));
            await _firebaseAuth.signOut();
        }
    } catch (e) {
        emit(AuthState.error('Failed to load user profile: $e'));
    }
  }
}
