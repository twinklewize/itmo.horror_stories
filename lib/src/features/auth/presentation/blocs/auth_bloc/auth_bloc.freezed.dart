// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthEventSignInCopyWith<$Res> {
  factory _$$_AuthEventSignInCopyWith(
          _$_AuthEventSignIn value, $Res Function(_$_AuthEventSignIn) then) =
      __$$_AuthEventSignInCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$_AuthEventSignInCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthEventSignIn>
    implements _$$_AuthEventSignInCopyWith<$Res> {
  __$$_AuthEventSignInCopyWithImpl(
      _$_AuthEventSignIn _value, $Res Function(_$_AuthEventSignIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$_AuthEventSignIn(
      null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthEventSignIn extends _AuthEventSignIn {
  const _$_AuthEventSignIn(this.login, this.password) : super._();

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signIn(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthEventSignIn &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthEventSignInCopyWith<_$_AuthEventSignIn> get copyWith =>
      __$$_AuthEventSignInCopyWithImpl<_$_AuthEventSignIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) {
    return signIn(login, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) {
    return signIn?.call(login, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(login, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _AuthEventSignIn extends AuthEvent {
  const factory _AuthEventSignIn(final String login, final String password) =
      _$_AuthEventSignIn;
  const _AuthEventSignIn._() : super._();

  String get login;
  String get password;
  @JsonKey(ignore: true)
  _$$_AuthEventSignInCopyWith<_$_AuthEventSignIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthEventSignUpCopyWith<$Res> {
  factory _$$_AuthEventSignUpCopyWith(
          _$_AuthEventSignUp value, $Res Function(_$_AuthEventSignUp) then) =
      __$$_AuthEventSignUpCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String password, String nickname});
}

/// @nodoc
class __$$_AuthEventSignUpCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthEventSignUp>
    implements _$$_AuthEventSignUpCopyWith<$Res> {
  __$$_AuthEventSignUpCopyWithImpl(
      _$_AuthEventSignUp _value, $Res Function(_$_AuthEventSignUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? nickname = null,
  }) {
    return _then(_$_AuthEventSignUp(
      null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthEventSignUp extends _AuthEventSignUp {
  const _$_AuthEventSignUp(this.login, this.password, this.nickname)
      : super._();

  @override
  final String login;
  @override
  final String password;
  @override
  final String nickname;

  @override
  String toString() {
    return 'AuthEvent.signUp(login: $login, password: $password, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthEventSignUp &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, password, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthEventSignUpCopyWith<_$_AuthEventSignUp> get copyWith =>
      __$$_AuthEventSignUpCopyWithImpl<_$_AuthEventSignUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) {
    return signUp(login, password, nickname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) {
    return signUp?.call(login, password, nickname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(login, password, nickname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _AuthEventSignUp extends AuthEvent {
  const factory _AuthEventSignUp(
          final String login, final String password, final String nickname) =
      _$_AuthEventSignUp;
  const _AuthEventSignUp._() : super._();

  String get login;
  String get password;
  String get nickname;
  @JsonKey(ignore: true)
  _$$_AuthEventSignUpCopyWith<_$_AuthEventSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthEventSignOutCopyWith<$Res> {
  factory _$$_AuthEventSignOutCopyWith(
          _$_AuthEventSignOut value, $Res Function(_$_AuthEventSignOut) then) =
      __$$_AuthEventSignOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthEventSignOutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthEventSignOut>
    implements _$$_AuthEventSignOutCopyWith<$Res> {
  __$$_AuthEventSignOutCopyWithImpl(
      _$_AuthEventSignOut _value, $Res Function(_$_AuthEventSignOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthEventSignOut extends _AuthEventSignOut {
  const _$_AuthEventSignOut() : super._();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthEventSignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _AuthEventSignOut extends AuthEvent {
  const factory _AuthEventSignOut() = _$_AuthEventSignOut;
  const _AuthEventSignOut._() : super._();
}

/// @nodoc
abstract class _$$_AuthEventRestoreCopyWith<$Res> {
  factory _$$_AuthEventRestoreCopyWith(
          _$_AuthEventRestore value, $Res Function(_$_AuthEventRestore) then) =
      __$$_AuthEventRestoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthEventRestoreCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthEventRestore>
    implements _$$_AuthEventRestoreCopyWith<$Res> {
  __$$_AuthEventRestoreCopyWithImpl(
      _$_AuthEventRestore _value, $Res Function(_$_AuthEventRestore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthEventRestore extends _AuthEventRestore {
  const _$_AuthEventRestore() : super._();

  @override
  String toString() {
    return 'AuthEvent.restoreSession()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthEventRestore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) {
    return restoreSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) {
    return restoreSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) {
    if (restoreSession != null) {
      return restoreSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) {
    return restoreSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) {
    return restoreSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) {
    if (restoreSession != null) {
      return restoreSession(this);
    }
    return orElse();
  }
}

abstract class _AuthEventRestore extends AuthEvent {
  const factory _AuthEventRestore() = _$_AuthEventRestore;
  const _AuthEventRestore._() : super._();
}

/// @nodoc
abstract class _$$_AuthEventRefreshSessionCopyWith<$Res> {
  factory _$$_AuthEventRefreshSessionCopyWith(_$_AuthEventRefreshSession value,
          $Res Function(_$_AuthEventRefreshSession) then) =
      __$$_AuthEventRefreshSessionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthEventRefreshSessionCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AuthEventRefreshSession>
    implements _$$_AuthEventRefreshSessionCopyWith<$Res> {
  __$$_AuthEventRefreshSessionCopyWithImpl(_$_AuthEventRefreshSession _value,
      $Res Function(_$_AuthEventRefreshSession) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthEventRefreshSession extends _AuthEventRefreshSession {
  const _$_AuthEventRefreshSession() : super._();

  @override
  String toString() {
    return 'AuthEvent.updateSession()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthEventRefreshSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String login, String password) signIn,
    required TResult Function(String login, String password, String nickname)
        signUp,
    required TResult Function() signOut,
    required TResult Function() restoreSession,
    required TResult Function() updateSession,
  }) {
    return updateSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String login, String password)? signIn,
    TResult? Function(String login, String password, String nickname)? signUp,
    TResult? Function()? signOut,
    TResult? Function()? restoreSession,
    TResult? Function()? updateSession,
  }) {
    return updateSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String login, String password)? signIn,
    TResult Function(String login, String password, String nickname)? signUp,
    TResult Function()? signOut,
    TResult Function()? restoreSession,
    TResult Function()? updateSession,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthEventSignIn value) signIn,
    required TResult Function(_AuthEventSignUp value) signUp,
    required TResult Function(_AuthEventSignOut value) signOut,
    required TResult Function(_AuthEventRestore value) restoreSession,
    required TResult Function(_AuthEventRefreshSession value) updateSession,
  }) {
    return updateSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthEventSignIn value)? signIn,
    TResult? Function(_AuthEventSignUp value)? signUp,
    TResult? Function(_AuthEventSignOut value)? signOut,
    TResult? Function(_AuthEventRestore value)? restoreSession,
    TResult? Function(_AuthEventRefreshSession value)? updateSession,
  }) {
    return updateSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthEventSignIn value)? signIn,
    TResult Function(_AuthEventSignUp value)? signUp,
    TResult Function(_AuthEventSignOut value)? signOut,
    TResult Function(_AuthEventRestore value)? restoreSession,
    TResult Function(_AuthEventRefreshSession value)? updateSession,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession(this);
    }
    return orElse();
  }
}

abstract class _AuthEventRefreshSession extends AuthEvent {
  const factory _AuthEventRefreshSession() = _$_AuthEventRefreshSession;
  const _AuthEventRefreshSession._() : super._();
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(SessionModel session) authorized,
    required TResult Function() pending,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(SessionModel session)? authorized,
    TResult? Function()? pending,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(SessionModel session)? authorized,
    TResult Function()? pending,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthorizedAuthState value) unauthorized,
    required TResult Function(_AuthorizedAuthState value) authorized,
    required TResult Function(_PendingAuthState value) pending,
    required TResult Function(_FailedAuthState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthorizedAuthState value)? unauthorized,
    TResult? Function(_AuthorizedAuthState value)? authorized,
    TResult? Function(_PendingAuthState value)? pending,
    TResult? Function(_FailedAuthState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthorizedAuthState value)? unauthorized,
    TResult Function(_AuthorizedAuthState value)? authorized,
    TResult Function(_PendingAuthState value)? pending,
    TResult Function(_FailedAuthState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnauthorizedAuthStateCopyWith<$Res> {
  factory _$$_UnauthorizedAuthStateCopyWith(_$_UnauthorizedAuthState value,
          $Res Function(_$_UnauthorizedAuthState) then) =
      __$$_UnauthorizedAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthorizedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_UnauthorizedAuthState>
    implements _$$_UnauthorizedAuthStateCopyWith<$Res> {
  __$$_UnauthorizedAuthStateCopyWithImpl(_$_UnauthorizedAuthState _value,
      $Res Function(_$_UnauthorizedAuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnauthorizedAuthState extends _UnauthorizedAuthState {
  const _$_UnauthorizedAuthState() : super._();

  @override
  String toString() {
    return 'AuthState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnauthorizedAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(SessionModel session) authorized,
    required TResult Function() pending,
    required TResult Function(String message) failed,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(SessionModel session)? authorized,
    TResult? Function()? pending,
    TResult? Function(String message)? failed,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(SessionModel session)? authorized,
    TResult Function()? pending,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthorizedAuthState value) unauthorized,
    required TResult Function(_AuthorizedAuthState value) authorized,
    required TResult Function(_PendingAuthState value) pending,
    required TResult Function(_FailedAuthState value) failed,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthorizedAuthState value)? unauthorized,
    TResult? Function(_AuthorizedAuthState value)? authorized,
    TResult? Function(_PendingAuthState value)? pending,
    TResult? Function(_FailedAuthState value)? failed,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthorizedAuthState value)? unauthorized,
    TResult Function(_AuthorizedAuthState value)? authorized,
    TResult Function(_PendingAuthState value)? pending,
    TResult Function(_FailedAuthState value)? failed,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _UnauthorizedAuthState extends AuthState {
  const factory _UnauthorizedAuthState() = _$_UnauthorizedAuthState;
  const _UnauthorizedAuthState._() : super._();
}

/// @nodoc
abstract class _$$_AuthorizedAuthStateCopyWith<$Res> {
  factory _$$_AuthorizedAuthStateCopyWith(_$_AuthorizedAuthState value,
          $Res Function(_$_AuthorizedAuthState) then) =
      __$$_AuthorizedAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionModel session});
}

/// @nodoc
class __$$_AuthorizedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthorizedAuthState>
    implements _$$_AuthorizedAuthStateCopyWith<$Res> {
  __$$_AuthorizedAuthStateCopyWithImpl(_$_AuthorizedAuthState _value,
      $Res Function(_$_AuthorizedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$_AuthorizedAuthState(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel,
    ));
  }
}

/// @nodoc

class _$_AuthorizedAuthState extends _AuthorizedAuthState {
  const _$_AuthorizedAuthState(this.session) : super._();

  @override
  final SessionModel session;

  @override
  String toString() {
    return 'AuthState.authorized(session: $session)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorizedAuthState &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorizedAuthStateCopyWith<_$_AuthorizedAuthState> get copyWith =>
      __$$_AuthorizedAuthStateCopyWithImpl<_$_AuthorizedAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(SessionModel session) authorized,
    required TResult Function() pending,
    required TResult Function(String message) failed,
  }) {
    return authorized(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(SessionModel session)? authorized,
    TResult? Function()? pending,
    TResult? Function(String message)? failed,
  }) {
    return authorized?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(SessionModel session)? authorized,
    TResult Function()? pending,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthorizedAuthState value) unauthorized,
    required TResult Function(_AuthorizedAuthState value) authorized,
    required TResult Function(_PendingAuthState value) pending,
    required TResult Function(_FailedAuthState value) failed,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthorizedAuthState value)? unauthorized,
    TResult? Function(_AuthorizedAuthState value)? authorized,
    TResult? Function(_PendingAuthState value)? pending,
    TResult? Function(_FailedAuthState value)? failed,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthorizedAuthState value)? unauthorized,
    TResult Function(_AuthorizedAuthState value)? authorized,
    TResult Function(_PendingAuthState value)? pending,
    TResult Function(_FailedAuthState value)? failed,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _AuthorizedAuthState extends AuthState {
  const factory _AuthorizedAuthState(final SessionModel session) =
      _$_AuthorizedAuthState;
  const _AuthorizedAuthState._() : super._();

  SessionModel get session;
  @JsonKey(ignore: true)
  _$$_AuthorizedAuthStateCopyWith<_$_AuthorizedAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PendingAuthStateCopyWith<$Res> {
  factory _$$_PendingAuthStateCopyWith(
          _$_PendingAuthState value, $Res Function(_$_PendingAuthState) then) =
      __$$_PendingAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PendingAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_PendingAuthState>
    implements _$$_PendingAuthStateCopyWith<$Res> {
  __$$_PendingAuthStateCopyWithImpl(
      _$_PendingAuthState _value, $Res Function(_$_PendingAuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PendingAuthState extends _PendingAuthState {
  const _$_PendingAuthState() : super._();

  @override
  String toString() {
    return 'AuthState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PendingAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(SessionModel session) authorized,
    required TResult Function() pending,
    required TResult Function(String message) failed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(SessionModel session)? authorized,
    TResult? Function()? pending,
    TResult? Function(String message)? failed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(SessionModel session)? authorized,
    TResult Function()? pending,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthorizedAuthState value) unauthorized,
    required TResult Function(_AuthorizedAuthState value) authorized,
    required TResult Function(_PendingAuthState value) pending,
    required TResult Function(_FailedAuthState value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthorizedAuthState value)? unauthorized,
    TResult? Function(_AuthorizedAuthState value)? authorized,
    TResult? Function(_PendingAuthState value)? pending,
    TResult? Function(_FailedAuthState value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthorizedAuthState value)? unauthorized,
    TResult Function(_AuthorizedAuthState value)? authorized,
    TResult Function(_PendingAuthState value)? pending,
    TResult Function(_FailedAuthState value)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _PendingAuthState extends AuthState {
  const factory _PendingAuthState() = _$_PendingAuthState;
  const _PendingAuthState._() : super._();
}

/// @nodoc
abstract class _$$_FailedAuthStateCopyWith<$Res> {
  factory _$$_FailedAuthStateCopyWith(
          _$_FailedAuthState value, $Res Function(_$_FailedAuthState) then) =
      __$$_FailedAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FailedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_FailedAuthState>
    implements _$$_FailedAuthStateCopyWith<$Res> {
  __$$_FailedAuthStateCopyWithImpl(
      _$_FailedAuthState _value, $Res Function(_$_FailedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_FailedAuthState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FailedAuthState extends _FailedAuthState {
  const _$_FailedAuthState(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailedAuthState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedAuthStateCopyWith<_$_FailedAuthState> get copyWith =>
      __$$_FailedAuthStateCopyWithImpl<_$_FailedAuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(SessionModel session) authorized,
    required TResult Function() pending,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(SessionModel session)? authorized,
    TResult? Function()? pending,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(SessionModel session)? authorized,
    TResult Function()? pending,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthorizedAuthState value) unauthorized,
    required TResult Function(_AuthorizedAuthState value) authorized,
    required TResult Function(_PendingAuthState value) pending,
    required TResult Function(_FailedAuthState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthorizedAuthState value)? unauthorized,
    TResult? Function(_AuthorizedAuthState value)? authorized,
    TResult? Function(_PendingAuthState value)? pending,
    TResult? Function(_FailedAuthState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthorizedAuthState value)? unauthorized,
    TResult Function(_AuthorizedAuthState value)? authorized,
    TResult Function(_PendingAuthState value)? pending,
    TResult Function(_FailedAuthState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _FailedAuthState extends AuthState {
  const factory _FailedAuthState(final String message) = _$_FailedAuthState;
  const _FailedAuthState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_FailedAuthStateCopyWith<_$_FailedAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
