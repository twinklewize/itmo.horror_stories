// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        joinRoom,
    required TResult Function(int roomCode) leaveRoom,
    required TResult Function() updateRoom,
    required TResult Function(RoomInfoModel roomInfo) createRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult? Function(int roomCode)? leaveRoom,
    TResult? Function()? updateRoom,
    TResult? Function(RoomInfoModel roomInfo)? createRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult Function(int roomCode)? leaveRoom,
    TResult Function()? updateRoom,
    TResult Function(RoomInfoModel roomInfo)? createRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomJoinEvent value) joinRoom,
    required TResult Function(_RoomLeaveEvent value) leaveRoom,
    required TResult Function(_RoomUpdateEvent value) updateRoom,
    required TResult Function(_RoomCreateEvent value) createRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomJoinEvent value)? joinRoom,
    TResult? Function(_RoomLeaveEvent value)? leaveRoom,
    TResult? Function(_RoomUpdateEvent value)? updateRoom,
    TResult? Function(_RoomCreateEvent value)? createRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomJoinEvent value)? joinRoom,
    TResult Function(_RoomLeaveEvent value)? leaveRoom,
    TResult Function(_RoomUpdateEvent value)? updateRoom,
    TResult Function(_RoomCreateEvent value)? createRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEventCopyWith<$Res> {
  factory $RoomEventCopyWith(RoomEvent value, $Res Function(RoomEvent) then) =
      _$RoomEventCopyWithImpl<$Res, RoomEvent>;
}

/// @nodoc
class _$RoomEventCopyWithImpl<$Res, $Val extends RoomEvent>
    implements $RoomEventCopyWith<$Res> {
  _$RoomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RoomJoinEventCopyWith<$Res> {
  factory _$$_RoomJoinEventCopyWith(
          _$_RoomJoinEvent value, $Res Function(_$_RoomJoinEvent) then) =
      __$$_RoomJoinEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomInfoModel roomInfo, String userNickname});

  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class __$$_RoomJoinEventCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res, _$_RoomJoinEvent>
    implements _$$_RoomJoinEventCopyWith<$Res> {
  __$$_RoomJoinEventCopyWithImpl(
      _$_RoomJoinEvent _value, $Res Function(_$_RoomJoinEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? userNickname = null,
  }) {
    return _then(_$_RoomJoinEvent(
      roomInfo: null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomInfoModelCopyWith<$Res> get roomInfo {
    return $RoomInfoModelCopyWith<$Res>(_value.roomInfo, (value) {
      return _then(_value.copyWith(roomInfo: value));
    });
  }
}

/// @nodoc

class _$_RoomJoinEvent implements _RoomJoinEvent {
  const _$_RoomJoinEvent({required this.roomInfo, required this.userNickname});

  @override
  final RoomInfoModel roomInfo;
  @override
  final String userNickname;

  @override
  String toString() {
    return 'RoomEvent.joinRoom(roomInfo: $roomInfo, userNickname: $userNickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomJoinEvent &&
            (identical(other.roomInfo, roomInfo) ||
                other.roomInfo == roomInfo) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomInfo, userNickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomJoinEventCopyWith<_$_RoomJoinEvent> get copyWith =>
      __$$_RoomJoinEventCopyWithImpl<_$_RoomJoinEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        joinRoom,
    required TResult Function(int roomCode) leaveRoom,
    required TResult Function() updateRoom,
    required TResult Function(RoomInfoModel roomInfo) createRoom,
  }) {
    return joinRoom(roomInfo, userNickname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult? Function(int roomCode)? leaveRoom,
    TResult? Function()? updateRoom,
    TResult? Function(RoomInfoModel roomInfo)? createRoom,
  }) {
    return joinRoom?.call(roomInfo, userNickname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult Function(int roomCode)? leaveRoom,
    TResult Function()? updateRoom,
    TResult Function(RoomInfoModel roomInfo)? createRoom,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(roomInfo, userNickname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomJoinEvent value) joinRoom,
    required TResult Function(_RoomLeaveEvent value) leaveRoom,
    required TResult Function(_RoomUpdateEvent value) updateRoom,
    required TResult Function(_RoomCreateEvent value) createRoom,
  }) {
    return joinRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomJoinEvent value)? joinRoom,
    TResult? Function(_RoomLeaveEvent value)? leaveRoom,
    TResult? Function(_RoomUpdateEvent value)? updateRoom,
    TResult? Function(_RoomCreateEvent value)? createRoom,
  }) {
    return joinRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomJoinEvent value)? joinRoom,
    TResult Function(_RoomLeaveEvent value)? leaveRoom,
    TResult Function(_RoomUpdateEvent value)? updateRoom,
    TResult Function(_RoomCreateEvent value)? createRoom,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(this);
    }
    return orElse();
  }
}

abstract class _RoomJoinEvent implements RoomEvent {
  const factory _RoomJoinEvent(
      {required final RoomInfoModel roomInfo,
      required final String userNickname}) = _$_RoomJoinEvent;

  RoomInfoModel get roomInfo;
  String get userNickname;
  @JsonKey(ignore: true)
  _$$_RoomJoinEventCopyWith<_$_RoomJoinEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RoomLeaveEventCopyWith<$Res> {
  factory _$$_RoomLeaveEventCopyWith(
          _$_RoomLeaveEvent value, $Res Function(_$_RoomLeaveEvent) then) =
      __$$_RoomLeaveEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int roomCode});
}

/// @nodoc
class __$$_RoomLeaveEventCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res, _$_RoomLeaveEvent>
    implements _$$_RoomLeaveEventCopyWith<$Res> {
  __$$_RoomLeaveEventCopyWithImpl(
      _$_RoomLeaveEvent _value, $Res Function(_$_RoomLeaveEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomCode = null,
  }) {
    return _then(_$_RoomLeaveEvent(
      null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RoomLeaveEvent implements _RoomLeaveEvent {
  const _$_RoomLeaveEvent(this.roomCode);

  @override
  final int roomCode;

  @override
  String toString() {
    return 'RoomEvent.leaveRoom(roomCode: $roomCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomLeaveEvent &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomLeaveEventCopyWith<_$_RoomLeaveEvent> get copyWith =>
      __$$_RoomLeaveEventCopyWithImpl<_$_RoomLeaveEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        joinRoom,
    required TResult Function(int roomCode) leaveRoom,
    required TResult Function() updateRoom,
    required TResult Function(RoomInfoModel roomInfo) createRoom,
  }) {
    return leaveRoom(roomCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult? Function(int roomCode)? leaveRoom,
    TResult? Function()? updateRoom,
    TResult? Function(RoomInfoModel roomInfo)? createRoom,
  }) {
    return leaveRoom?.call(roomCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult Function(int roomCode)? leaveRoom,
    TResult Function()? updateRoom,
    TResult Function(RoomInfoModel roomInfo)? createRoom,
    required TResult orElse(),
  }) {
    if (leaveRoom != null) {
      return leaveRoom(roomCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomJoinEvent value) joinRoom,
    required TResult Function(_RoomLeaveEvent value) leaveRoom,
    required TResult Function(_RoomUpdateEvent value) updateRoom,
    required TResult Function(_RoomCreateEvent value) createRoom,
  }) {
    return leaveRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomJoinEvent value)? joinRoom,
    TResult? Function(_RoomLeaveEvent value)? leaveRoom,
    TResult? Function(_RoomUpdateEvent value)? updateRoom,
    TResult? Function(_RoomCreateEvent value)? createRoom,
  }) {
    return leaveRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomJoinEvent value)? joinRoom,
    TResult Function(_RoomLeaveEvent value)? leaveRoom,
    TResult Function(_RoomUpdateEvent value)? updateRoom,
    TResult Function(_RoomCreateEvent value)? createRoom,
    required TResult orElse(),
  }) {
    if (leaveRoom != null) {
      return leaveRoom(this);
    }
    return orElse();
  }
}

abstract class _RoomLeaveEvent implements RoomEvent {
  const factory _RoomLeaveEvent(final int roomCode) = _$_RoomLeaveEvent;

  int get roomCode;
  @JsonKey(ignore: true)
  _$$_RoomLeaveEventCopyWith<_$_RoomLeaveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RoomUpdateEventCopyWith<$Res> {
  factory _$$_RoomUpdateEventCopyWith(
          _$_RoomUpdateEvent value, $Res Function(_$_RoomUpdateEvent) then) =
      __$$_RoomUpdateEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RoomUpdateEventCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res, _$_RoomUpdateEvent>
    implements _$$_RoomUpdateEventCopyWith<$Res> {
  __$$_RoomUpdateEventCopyWithImpl(
      _$_RoomUpdateEvent _value, $Res Function(_$_RoomUpdateEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RoomUpdateEvent implements _RoomUpdateEvent {
  const _$_RoomUpdateEvent();

  @override
  String toString() {
    return 'RoomEvent.updateRoom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RoomUpdateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        joinRoom,
    required TResult Function(int roomCode) leaveRoom,
    required TResult Function() updateRoom,
    required TResult Function(RoomInfoModel roomInfo) createRoom,
  }) {
    return updateRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult? Function(int roomCode)? leaveRoom,
    TResult? Function()? updateRoom,
    TResult? Function(RoomInfoModel roomInfo)? createRoom,
  }) {
    return updateRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult Function(int roomCode)? leaveRoom,
    TResult Function()? updateRoom,
    TResult Function(RoomInfoModel roomInfo)? createRoom,
    required TResult orElse(),
  }) {
    if (updateRoom != null) {
      return updateRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomJoinEvent value) joinRoom,
    required TResult Function(_RoomLeaveEvent value) leaveRoom,
    required TResult Function(_RoomUpdateEvent value) updateRoom,
    required TResult Function(_RoomCreateEvent value) createRoom,
  }) {
    return updateRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomJoinEvent value)? joinRoom,
    TResult? Function(_RoomLeaveEvent value)? leaveRoom,
    TResult? Function(_RoomUpdateEvent value)? updateRoom,
    TResult? Function(_RoomCreateEvent value)? createRoom,
  }) {
    return updateRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomJoinEvent value)? joinRoom,
    TResult Function(_RoomLeaveEvent value)? leaveRoom,
    TResult Function(_RoomUpdateEvent value)? updateRoom,
    TResult Function(_RoomCreateEvent value)? createRoom,
    required TResult orElse(),
  }) {
    if (updateRoom != null) {
      return updateRoom(this);
    }
    return orElse();
  }
}

abstract class _RoomUpdateEvent implements RoomEvent {
  const factory _RoomUpdateEvent() = _$_RoomUpdateEvent;
}

/// @nodoc
abstract class _$$_RoomCreateEventCopyWith<$Res> {
  factory _$$_RoomCreateEventCopyWith(
          _$_RoomCreateEvent value, $Res Function(_$_RoomCreateEvent) then) =
      __$$_RoomCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomInfoModel roomInfo});

  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class __$$_RoomCreateEventCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res, _$_RoomCreateEvent>
    implements _$$_RoomCreateEventCopyWith<$Res> {
  __$$_RoomCreateEventCopyWithImpl(
      _$_RoomCreateEvent _value, $Res Function(_$_RoomCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
  }) {
    return _then(_$_RoomCreateEvent(
      null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomInfoModelCopyWith<$Res> get roomInfo {
    return $RoomInfoModelCopyWith<$Res>(_value.roomInfo, (value) {
      return _then(_value.copyWith(roomInfo: value));
    });
  }
}

/// @nodoc

class _$_RoomCreateEvent implements _RoomCreateEvent {
  const _$_RoomCreateEvent(this.roomInfo);

  @override
  final RoomInfoModel roomInfo;

  @override
  String toString() {
    return 'RoomEvent.createRoom(roomInfo: $roomInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomCreateEvent &&
            (identical(other.roomInfo, roomInfo) ||
                other.roomInfo == roomInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomCreateEventCopyWith<_$_RoomCreateEvent> get copyWith =>
      __$$_RoomCreateEventCopyWithImpl<_$_RoomCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        joinRoom,
    required TResult Function(int roomCode) leaveRoom,
    required TResult Function() updateRoom,
    required TResult Function(RoomInfoModel roomInfo) createRoom,
  }) {
    return createRoom(roomInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult? Function(int roomCode)? leaveRoom,
    TResult? Function()? updateRoom,
    TResult? Function(RoomInfoModel roomInfo)? createRoom,
  }) {
    return createRoom?.call(roomInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? joinRoom,
    TResult Function(int roomCode)? leaveRoom,
    TResult Function()? updateRoom,
    TResult Function(RoomInfoModel roomInfo)? createRoom,
    required TResult orElse(),
  }) {
    if (createRoom != null) {
      return createRoom(roomInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomJoinEvent value) joinRoom,
    required TResult Function(_RoomLeaveEvent value) leaveRoom,
    required TResult Function(_RoomUpdateEvent value) updateRoom,
    required TResult Function(_RoomCreateEvent value) createRoom,
  }) {
    return createRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomJoinEvent value)? joinRoom,
    TResult? Function(_RoomLeaveEvent value)? leaveRoom,
    TResult? Function(_RoomUpdateEvent value)? updateRoom,
    TResult? Function(_RoomCreateEvent value)? createRoom,
  }) {
    return createRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomJoinEvent value)? joinRoom,
    TResult Function(_RoomLeaveEvent value)? leaveRoom,
    TResult Function(_RoomUpdateEvent value)? updateRoom,
    TResult Function(_RoomCreateEvent value)? createRoom,
    required TResult orElse(),
  }) {
    if (createRoom != null) {
      return createRoom(this);
    }
    return orElse();
  }
}

abstract class _RoomCreateEvent implements RoomEvent {
  const factory _RoomCreateEvent(final RoomInfoModel roomInfo) =
      _$_RoomCreateEvent;

  RoomInfoModel get roomInfo;
  @JsonKey(ignore: true)
  _$$_RoomCreateEventCopyWith<_$_RoomCreateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(RoomModel room) succeeded,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(RoomModel room)? succeeded,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(RoomModel room)? succeeded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomInitialState value) initial,
    required TResult Function(_RoomPendingState value) pending,
    required TResult Function(_RoomsSucceededState value) succeeded,
    required TResult Function(_RoomFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomInitialState value)? initial,
    TResult? Function(_RoomPendingState value)? pending,
    TResult? Function(_RoomsSucceededState value)? succeeded,
    TResult? Function(_RoomFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomInitialState value)? initial,
    TResult Function(_RoomPendingState value)? pending,
    TResult Function(_RoomsSucceededState value)? succeeded,
    TResult Function(_RoomFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res, RoomState>;
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res, $Val extends RoomState>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RoomInitialStateCopyWith<$Res> {
  factory _$$_RoomInitialStateCopyWith(
          _$_RoomInitialState value, $Res Function(_$_RoomInitialState) then) =
      __$$_RoomInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RoomInitialStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$_RoomInitialState>
    implements _$$_RoomInitialStateCopyWith<$Res> {
  __$$_RoomInitialStateCopyWithImpl(
      _$_RoomInitialState _value, $Res Function(_$_RoomInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RoomInitialState extends _RoomInitialState {
  const _$_RoomInitialState() : super._();

  @override
  String toString() {
    return 'RoomState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RoomInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(RoomModel room) succeeded,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(RoomModel room)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(RoomModel room)? succeeded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomInitialState value) initial,
    required TResult Function(_RoomPendingState value) pending,
    required TResult Function(_RoomsSucceededState value) succeeded,
    required TResult Function(_RoomFailedState value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomInitialState value)? initial,
    TResult? Function(_RoomPendingState value)? pending,
    TResult? Function(_RoomsSucceededState value)? succeeded,
    TResult? Function(_RoomFailedState value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomInitialState value)? initial,
    TResult Function(_RoomPendingState value)? pending,
    TResult Function(_RoomsSucceededState value)? succeeded,
    TResult Function(_RoomFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RoomInitialState extends RoomState {
  const factory _RoomInitialState() = _$_RoomInitialState;
  const _RoomInitialState._() : super._();
}

/// @nodoc
abstract class _$$_RoomPendingStateCopyWith<$Res> {
  factory _$$_RoomPendingStateCopyWith(
          _$_RoomPendingState value, $Res Function(_$_RoomPendingState) then) =
      __$$_RoomPendingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RoomPendingStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$_RoomPendingState>
    implements _$$_RoomPendingStateCopyWith<$Res> {
  __$$_RoomPendingStateCopyWithImpl(
      _$_RoomPendingState _value, $Res Function(_$_RoomPendingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RoomPendingState extends _RoomPendingState {
  const _$_RoomPendingState() : super._();

  @override
  String toString() {
    return 'RoomState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RoomPendingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(RoomModel room) succeeded,
    required TResult Function(String message) failed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(RoomModel room)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(RoomModel room)? succeeded,
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
    required TResult Function(_RoomInitialState value) initial,
    required TResult Function(_RoomPendingState value) pending,
    required TResult Function(_RoomsSucceededState value) succeeded,
    required TResult Function(_RoomFailedState value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomInitialState value)? initial,
    TResult? Function(_RoomPendingState value)? pending,
    TResult? Function(_RoomsSucceededState value)? succeeded,
    TResult? Function(_RoomFailedState value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomInitialState value)? initial,
    TResult Function(_RoomPendingState value)? pending,
    TResult Function(_RoomsSucceededState value)? succeeded,
    TResult Function(_RoomFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _RoomPendingState extends RoomState {
  const factory _RoomPendingState() = _$_RoomPendingState;
  const _RoomPendingState._() : super._();
}

/// @nodoc
abstract class _$$_RoomsSucceededStateCopyWith<$Res> {
  factory _$$_RoomsSucceededStateCopyWith(_$_RoomsSucceededState value,
          $Res Function(_$_RoomsSucceededState) then) =
      __$$_RoomsSucceededStateCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomModel room});

  $RoomModelCopyWith<$Res> get room;
}

/// @nodoc
class __$$_RoomsSucceededStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$_RoomsSucceededState>
    implements _$$_RoomsSucceededStateCopyWith<$Res> {
  __$$_RoomsSucceededStateCopyWithImpl(_$_RoomsSucceededState _value,
      $Res Function(_$_RoomsSucceededState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$_RoomsSucceededState(
      null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res> get room {
    return $RoomModelCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$_RoomsSucceededState extends _RoomsSucceededState {
  const _$_RoomsSucceededState(this.room) : super._();

  @override
  final RoomModel room;

  @override
  String toString() {
    return 'RoomState.succeeded(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomsSucceededState &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomsSucceededStateCopyWith<_$_RoomsSucceededState> get copyWith =>
      __$$_RoomsSucceededStateCopyWithImpl<_$_RoomsSucceededState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(RoomModel room) succeeded,
    required TResult Function(String message) failed,
  }) {
    return succeeded(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(RoomModel room)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return succeeded?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(RoomModel room)? succeeded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RoomInitialState value) initial,
    required TResult Function(_RoomPendingState value) pending,
    required TResult Function(_RoomsSucceededState value) succeeded,
    required TResult Function(_RoomFailedState value) failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomInitialState value)? initial,
    TResult? Function(_RoomPendingState value)? pending,
    TResult? Function(_RoomsSucceededState value)? succeeded,
    TResult? Function(_RoomFailedState value)? failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomInitialState value)? initial,
    TResult Function(_RoomPendingState value)? pending,
    TResult Function(_RoomsSucceededState value)? succeeded,
    TResult Function(_RoomFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class _RoomsSucceededState extends RoomState {
  const factory _RoomsSucceededState(final RoomModel room) =
      _$_RoomsSucceededState;
  const _RoomsSucceededState._() : super._();

  RoomModel get room;
  @JsonKey(ignore: true)
  _$$_RoomsSucceededStateCopyWith<_$_RoomsSucceededState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RoomFailedStateCopyWith<$Res> {
  factory _$$_RoomFailedStateCopyWith(
          _$_RoomFailedState value, $Res Function(_$_RoomFailedState) then) =
      __$$_RoomFailedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_RoomFailedStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res, _$_RoomFailedState>
    implements _$$_RoomFailedStateCopyWith<$Res> {
  __$$_RoomFailedStateCopyWithImpl(
      _$_RoomFailedState _value, $Res Function(_$_RoomFailedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_RoomFailedState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RoomFailedState extends _RoomFailedState {
  const _$_RoomFailedState(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'RoomState.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomFailedState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomFailedStateCopyWith<_$_RoomFailedState> get copyWith =>
      __$$_RoomFailedStateCopyWithImpl<_$_RoomFailedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(RoomModel room) succeeded,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(RoomModel room)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(RoomModel room)? succeeded,
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
    required TResult Function(_RoomInitialState value) initial,
    required TResult Function(_RoomPendingState value) pending,
    required TResult Function(_RoomsSucceededState value) succeeded,
    required TResult Function(_RoomFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RoomInitialState value)? initial,
    TResult? Function(_RoomPendingState value)? pending,
    TResult? Function(_RoomsSucceededState value)? succeeded,
    TResult? Function(_RoomFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RoomInitialState value)? initial,
    TResult Function(_RoomPendingState value)? pending,
    TResult Function(_RoomsSucceededState value)? succeeded,
    TResult Function(_RoomFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _RoomFailedState extends RoomState {
  const factory _RoomFailedState(final String message) = _$_RoomFailedState;
  const _RoomFailedState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_RoomFailedStateCopyWith<_$_RoomFailedState> get copyWith =>
      throw _privateConstructorUsedError;
}
