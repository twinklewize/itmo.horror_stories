part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.signIn(String login, String password) = _AuthEventSignIn;
  const factory AuthEvent.signUp(String login, String password, String nickname) = _AuthEventSignUp;
  const factory AuthEvent.signOut() = _AuthEventSignOut;
  const factory AuthEvent.restoreSession() = _AuthEventRestore;
  const factory AuthEvent.updateSession() = _AuthEventRefreshSession;
}
