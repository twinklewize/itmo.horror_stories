part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.unauthorized() = _UnauthorizedAuthState;

  const factory AuthState.authorized(SessionModel session) = _AuthorizedAuthState;

  const factory AuthState.pending() = _PendingAuthState;

  const factory AuthState.failed(String message) = _FailedAuthState;

  SessionModel? get session {
    return maybeWhen(
      authorized: (session) => session,
      orElse: () => null,
    );
  }

  AuthStateIsTypeHelpers get isType {
    return AuthStateIsTypeHelpers._(this);
  }
}

class AuthStateIsTypeHelpers {
  final AuthState _s;

  AuthStateIsTypeHelpers._(this._s);

  bool get unauthorized => _s is _UnauthorizedAuthState;
  bool get authorized => _s is _AuthorizedAuthState;
  bool get pending => _s is _PendingAuthState;
  bool get failed => _s is _FailedAuthState;
}
