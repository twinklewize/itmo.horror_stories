import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/features/auth/data/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.unauthorized()) {
    on<AuthEvent>(
      (event, emitter) => event.map(
        signIn: (event) => _signIn(event, emitter),
        signUp: (event) => _signUp(event, emitter),
        signOut: (event) => _signOut(event, emitter),
        restoreSession: (event) => _restoreSession(event, emitter),
        updateSession: (event) => _updateSession(event, emitter),
      ),
    );
  }

  Future<void> _signIn(
    _AuthEventSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.pending());
    try {
      final result = await _authRepository.signIn(
        login: event.login,
        password: event.password,
      );
      emit(AuthState.authorized(result));
    } catch (e) {
      emit(const AuthState.failed('Произошла ошибка'));
    }
  }

  Future<void> _signUp(
    _AuthEventSignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.pending());
    try {
      final result = await _authRepository.signUp(
        login: event.login,
        password: event.password,
        nickname: event.nickname,
      );
      emit(AuthState.authorized(result));
    } catch (e) {
      emit(const AuthState.failed('Произошла ошибка'));
    }
  }

  Future<void> _restoreSession(
    _AuthEventRestore event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final result = await _authRepository.restore();
      if (result == null) {
        return emit(const AuthState.unauthorized());
      } else {
        return emit(AuthState.authorized(result));
      }
    } catch (e) {
      emit(const AuthState.unauthorized());
    }
  }

  Future<void> _signOut(
    _AuthEventSignOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.unauthorized());
  }

  Future<void> _updateSession(
    _AuthEventRefreshSession event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      await state.maybeWhen(
        authorized: (session) async {
          try {
            final newSession = await _authRepository.updateSession();
            return AuthState.authorized(newSession);
          } catch (e) {
            return const AuthState.unauthorized();
          }
        },
        orElse: () => const AuthState.unauthorized(),
      ),
    );
  }
}
