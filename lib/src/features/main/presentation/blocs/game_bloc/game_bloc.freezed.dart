// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GameRestoreEventCopyWith<$Res> {
  factory _$$_GameRestoreEventCopyWith(
          _$_GameRestoreEvent value, $Res Function(_$_GameRestoreEvent) then) =
      __$$_GameRestoreEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomInfoModel roomInfo, String userNickname});

  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class __$$_GameRestoreEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameRestoreEvent>
    implements _$$_GameRestoreEventCopyWith<$Res> {
  __$$_GameRestoreEventCopyWithImpl(
      _$_GameRestoreEvent _value, $Res Function(_$_GameRestoreEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? userNickname = null,
  }) {
    return _then(_$_GameRestoreEvent(
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

class _$_GameRestoreEvent implements _GameRestoreEvent {
  const _$_GameRestoreEvent(
      {required this.roomInfo, required this.userNickname});

  @override
  final RoomInfoModel roomInfo;
  @override
  final String userNickname;

  @override
  String toString() {
    return 'GameEvent.restoreGame(roomInfo: $roomInfo, userNickname: $userNickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameRestoreEvent &&
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
  _$$_GameRestoreEventCopyWith<_$_GameRestoreEvent> get copyWith =>
      __$$_GameRestoreEventCopyWithImpl<_$_GameRestoreEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return restoreGame(roomInfo, userNickname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return restoreGame?.call(roomInfo, userNickname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (restoreGame != null) {
      return restoreGame(roomInfo, userNickname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return restoreGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return restoreGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (restoreGame != null) {
      return restoreGame(this);
    }
    return orElse();
  }
}

abstract class _GameRestoreEvent implements GameEvent {
  const factory _GameRestoreEvent(
      {required final RoomInfoModel roomInfo,
      required final String userNickname}) = _$_GameRestoreEvent;

  RoomInfoModel get roomInfo;
  String get userNickname;
  @JsonKey(ignore: true)
  _$$_GameRestoreEventCopyWith<_$_GameRestoreEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameStartEventCopyWith<$Res> {
  factory _$$_GameStartEventCopyWith(
          _$_GameStartEvent value, $Res Function(_$_GameStartEvent) then) =
      __$$_GameStartEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomModel room});

  $RoomModelCopyWith<$Res> get room;
}

/// @nodoc
class __$$_GameStartEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameStartEvent>
    implements _$$_GameStartEventCopyWith<$Res> {
  __$$_GameStartEventCopyWithImpl(
      _$_GameStartEvent _value, $Res Function(_$_GameStartEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$_GameStartEvent(
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

class _$_GameStartEvent implements _GameStartEvent {
  const _$_GameStartEvent(this.room);

  @override
  final RoomModel room;

  @override
  String toString() {
    return 'GameEvent.startGame(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameStartEvent &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStartEventCopyWith<_$_GameStartEvent> get copyWith =>
      __$$_GameStartEventCopyWithImpl<_$_GameStartEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return startGame(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return startGame?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return startGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(this);
    }
    return orElse();
  }
}

abstract class _GameStartEvent implements GameEvent {
  const factory _GameStartEvent(final RoomModel room) = _$_GameStartEvent;

  RoomModel get room;
  @JsonKey(ignore: true)
  _$$_GameStartEventCopyWith<_$_GameStartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameJoinEventCopyWith<$Res> {
  factory _$$_GameJoinEventCopyWith(
          _$_GameJoinEvent value, $Res Function(_$_GameJoinEvent) then) =
      __$$_GameJoinEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomModel room});

  $RoomModelCopyWith<$Res> get room;
}

/// @nodoc
class __$$_GameJoinEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameJoinEvent>
    implements _$$_GameJoinEventCopyWith<$Res> {
  __$$_GameJoinEventCopyWithImpl(
      _$_GameJoinEvent _value, $Res Function(_$_GameJoinEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
  }) {
    return _then(_$_GameJoinEvent(
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

class _$_GameJoinEvent implements _GameJoinEvent {
  const _$_GameJoinEvent(this.room);

  @override
  final RoomModel room;

  @override
  String toString() {
    return 'GameEvent.joinGame(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameJoinEvent &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameJoinEventCopyWith<_$_GameJoinEvent> get copyWith =>
      __$$_GameJoinEventCopyWithImpl<_$_GameJoinEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return joinGame(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return joinGame?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (joinGame != null) {
      return joinGame(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return joinGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return joinGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (joinGame != null) {
      return joinGame(this);
    }
    return orElse();
  }
}

abstract class _GameJoinEvent implements GameEvent {
  const factory _GameJoinEvent(final RoomModel room) = _$_GameJoinEvent;

  RoomModel get room;
  @JsonKey(ignore: true)
  _$$_GameJoinEventCopyWith<_$_GameJoinEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameUpdateEventCopyWith<$Res> {
  factory _$$_GameUpdateEventCopyWith(
          _$_GameUpdateEvent value, $Res Function(_$_GameUpdateEvent) then) =
      __$$_GameUpdateEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GameUpdateEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameUpdateEvent>
    implements _$$_GameUpdateEventCopyWith<$Res> {
  __$$_GameUpdateEventCopyWithImpl(
      _$_GameUpdateEvent _value, $Res Function(_$_GameUpdateEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GameUpdateEvent implements _GameUpdateEvent {
  const _$_GameUpdateEvent();

  @override
  String toString() {
    return 'GameEvent.updateGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GameUpdateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return updateGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return updateGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (updateGame != null) {
      return updateGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return updateGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return updateGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (updateGame != null) {
      return updateGame(this);
    }
    return orElse();
  }
}

abstract class _GameUpdateEvent implements GameEvent {
  const factory _GameUpdateEvent() = _$_GameUpdateEvent;
}

/// @nodoc
abstract class _$$_GameTickEventCopyWith<$Res> {
  factory _$$_GameTickEventCopyWith(
          _$_GameTickEvent value, $Res Function(_$_GameTickEvent) then) =
      __$$_GameTickEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GameTickEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameTickEvent>
    implements _$$_GameTickEventCopyWith<$Res> {
  __$$_GameTickEventCopyWithImpl(
      _$_GameTickEvent _value, $Res Function(_$_GameTickEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GameTickEvent implements _GameTickEvent {
  const _$_GameTickEvent();

  @override
  String toString() {
    return 'GameEvent.tick()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GameTickEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return tick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return tick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return tick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return tick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick(this);
    }
    return orElse();
  }
}

abstract class _GameTickEvent implements GameEvent {
  const factory _GameTickEvent() = _$_GameTickEvent;
}

/// @nodoc
abstract class _$$_GameVoteEventCopyWith<$Res> {
  factory _$$_GameVoteEventCopyWith(
          _$_GameVoteEvent value, $Res Function(_$_GameVoteEvent) then) =
      __$$_GameVoteEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Id tableCardId});
}

/// @nodoc
class __$$_GameVoteEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameVoteEvent>
    implements _$$_GameVoteEventCopyWith<$Res> {
  __$$_GameVoteEventCopyWithImpl(
      _$_GameVoteEvent _value, $Res Function(_$_GameVoteEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableCardId = null,
  }) {
    return _then(_$_GameVoteEvent(
      null == tableCardId
          ? _value.tableCardId
          : tableCardId // ignore: cast_nullable_to_non_nullable
              as Id,
    ));
  }
}

/// @nodoc

class _$_GameVoteEvent implements _GameVoteEvent {
  const _$_GameVoteEvent(this.tableCardId);

  @override
  final Id tableCardId;

  @override
  String toString() {
    return 'GameEvent.vote(tableCardId: $tableCardId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameVoteEvent &&
            (identical(other.tableCardId, tableCardId) ||
                other.tableCardId == tableCardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableCardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameVoteEventCopyWith<_$_GameVoteEvent> get copyWith =>
      __$$_GameVoteEventCopyWithImpl<_$_GameVoteEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return vote(tableCardId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return vote?.call(tableCardId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (vote != null) {
      return vote(tableCardId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return vote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return vote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (vote != null) {
      return vote(this);
    }
    return orElse();
  }
}

abstract class _GameVoteEvent implements GameEvent {
  const factory _GameVoteEvent(final Id tableCardId) = _$_GameVoteEvent;

  Id get tableCardId;
  @JsonKey(ignore: true)
  _$$_GameVoteEventCopyWith<_$_GameVoteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameAddHintEventCopyWith<$Res> {
  factory _$$_GameAddHintEventCopyWith(
          _$_GameAddHintEvent value, $Res Function(_$_GameAddHintEvent) then) =
      __$$_GameAddHintEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardName, HintStatus hintStatus});
}

/// @nodoc
class __$$_GameAddHintEventCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$_GameAddHintEvent>
    implements _$$_GameAddHintEventCopyWith<$Res> {
  __$$_GameAddHintEventCopyWithImpl(
      _$_GameAddHintEvent _value, $Res Function(_$_GameAddHintEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardName = null,
    Object? hintStatus = null,
  }) {
    return _then(_$_GameAddHintEvent(
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      hintStatus: null == hintStatus
          ? _value.hintStatus
          : hintStatus // ignore: cast_nullable_to_non_nullable
              as HintStatus,
    ));
  }
}

/// @nodoc

class _$_GameAddHintEvent implements _GameAddHintEvent {
  const _$_GameAddHintEvent({required this.cardName, required this.hintStatus});

  @override
  final String cardName;
  @override
  final HintStatus hintStatus;

  @override
  String toString() {
    return 'GameEvent.addHint(cardName: $cardName, hintStatus: $hintStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameAddHintEvent &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.hintStatus, hintStatus) ||
                other.hintStatus == hintStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardName, hintStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameAddHintEventCopyWith<_$_GameAddHintEvent> get copyWith =>
      __$$_GameAddHintEventCopyWithImpl<_$_GameAddHintEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RoomInfoModel roomInfo, String userNickname)
        restoreGame,
    required TResult Function(RoomModel room) startGame,
    required TResult Function(RoomModel room) joinGame,
    required TResult Function() updateGame,
    required TResult Function() tick,
    required TResult Function(Id tableCardId) vote,
    required TResult Function(String cardName, HintStatus hintStatus) addHint,
  }) {
    return addHint(cardName, hintStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult? Function(RoomModel room)? startGame,
    TResult? Function(RoomModel room)? joinGame,
    TResult? Function()? updateGame,
    TResult? Function()? tick,
    TResult? Function(Id tableCardId)? vote,
    TResult? Function(String cardName, HintStatus hintStatus)? addHint,
  }) {
    return addHint?.call(cardName, hintStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RoomInfoModel roomInfo, String userNickname)? restoreGame,
    TResult Function(RoomModel room)? startGame,
    TResult Function(RoomModel room)? joinGame,
    TResult Function()? updateGame,
    TResult Function()? tick,
    TResult Function(Id tableCardId)? vote,
    TResult Function(String cardName, HintStatus hintStatus)? addHint,
    required TResult orElse(),
  }) {
    if (addHint != null) {
      return addHint(cardName, hintStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameRestoreEvent value) restoreGame,
    required TResult Function(_GameStartEvent value) startGame,
    required TResult Function(_GameJoinEvent value) joinGame,
    required TResult Function(_GameUpdateEvent value) updateGame,
    required TResult Function(_GameTickEvent value) tick,
    required TResult Function(_GameVoteEvent value) vote,
    required TResult Function(_GameAddHintEvent value) addHint,
  }) {
    return addHint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameRestoreEvent value)? restoreGame,
    TResult? Function(_GameStartEvent value)? startGame,
    TResult? Function(_GameJoinEvent value)? joinGame,
    TResult? Function(_GameUpdateEvent value)? updateGame,
    TResult? Function(_GameTickEvent value)? tick,
    TResult? Function(_GameVoteEvent value)? vote,
    TResult? Function(_GameAddHintEvent value)? addHint,
  }) {
    return addHint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameRestoreEvent value)? restoreGame,
    TResult Function(_GameStartEvent value)? startGame,
    TResult Function(_GameJoinEvent value)? joinGame,
    TResult Function(_GameUpdateEvent value)? updateGame,
    TResult Function(_GameTickEvent value)? tick,
    TResult Function(_GameVoteEvent value)? vote,
    TResult Function(_GameAddHintEvent value)? addHint,
    required TResult orElse(),
  }) {
    if (addHint != null) {
      return addHint(this);
    }
    return orElse();
  }
}

abstract class _GameAddHintEvent implements GameEvent {
  const factory _GameAddHintEvent(
      {required final String cardName,
      required final HintStatus hintStatus}) = _$_GameAddHintEvent;

  String get cardName;
  HintStatus get hintStatus;
  @JsonKey(ignore: true)
  _$$_GameAddHintEventCopyWith<_$_GameAddHintEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(GameModel game) succeeded,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(GameModel game)? succeeded,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(GameModel game)? succeeded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameInitialState value) initial,
    required TResult Function(_GamePendingState value) pending,
    required TResult Function(_GameSucceededState value) succeeded,
    required TResult Function(_GameFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameInitialState value)? initial,
    TResult? Function(_GamePendingState value)? pending,
    TResult? Function(_GameSucceededState value)? succeeded,
    TResult? Function(_GameFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameInitialState value)? initial,
    TResult Function(_GamePendingState value)? pending,
    TResult Function(_GameSucceededState value)? succeeded,
    TResult Function(_GameFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GameInitialStateCopyWith<$Res> {
  factory _$$_GameInitialStateCopyWith(
          _$_GameInitialState value, $Res Function(_$_GameInitialState) then) =
      __$$_GameInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GameInitialStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameInitialState>
    implements _$$_GameInitialStateCopyWith<$Res> {
  __$$_GameInitialStateCopyWithImpl(
      _$_GameInitialState _value, $Res Function(_$_GameInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GameInitialState extends _GameInitialState {
  const _$_GameInitialState() : super._();

  @override
  String toString() {
    return 'GameState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GameInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(GameModel game) succeeded,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(GameModel game)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(GameModel game)? succeeded,
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
    required TResult Function(_GameInitialState value) initial,
    required TResult Function(_GamePendingState value) pending,
    required TResult Function(_GameSucceededState value) succeeded,
    required TResult Function(_GameFailedState value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameInitialState value)? initial,
    TResult? Function(_GamePendingState value)? pending,
    TResult? Function(_GameSucceededState value)? succeeded,
    TResult? Function(_GameFailedState value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameInitialState value)? initial,
    TResult Function(_GamePendingState value)? pending,
    TResult Function(_GameSucceededState value)? succeeded,
    TResult Function(_GameFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _GameInitialState extends GameState {
  const factory _GameInitialState() = _$_GameInitialState;
  const _GameInitialState._() : super._();
}

/// @nodoc
abstract class _$$_GamePendingStateCopyWith<$Res> {
  factory _$$_GamePendingStateCopyWith(
          _$_GamePendingState value, $Res Function(_$_GamePendingState) then) =
      __$$_GamePendingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GamePendingStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GamePendingState>
    implements _$$_GamePendingStateCopyWith<$Res> {
  __$$_GamePendingStateCopyWithImpl(
      _$_GamePendingState _value, $Res Function(_$_GamePendingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GamePendingState extends _GamePendingState {
  const _$_GamePendingState() : super._();

  @override
  String toString() {
    return 'GameState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GamePendingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(GameModel game) succeeded,
    required TResult Function(String message) failed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(GameModel game)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(GameModel game)? succeeded,
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
    required TResult Function(_GameInitialState value) initial,
    required TResult Function(_GamePendingState value) pending,
    required TResult Function(_GameSucceededState value) succeeded,
    required TResult Function(_GameFailedState value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameInitialState value)? initial,
    TResult? Function(_GamePendingState value)? pending,
    TResult? Function(_GameSucceededState value)? succeeded,
    TResult? Function(_GameFailedState value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameInitialState value)? initial,
    TResult Function(_GamePendingState value)? pending,
    TResult Function(_GameSucceededState value)? succeeded,
    TResult Function(_GameFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _GamePendingState extends GameState {
  const factory _GamePendingState() = _$_GamePendingState;
  const _GamePendingState._() : super._();
}

/// @nodoc
abstract class _$$_GameSucceededStateCopyWith<$Res> {
  factory _$$_GameSucceededStateCopyWith(_$_GameSucceededState value,
          $Res Function(_$_GameSucceededState) then) =
      __$$_GameSucceededStateCopyWithImpl<$Res>;
  @useResult
  $Res call({GameModel game});

  $GameModelCopyWith<$Res> get game;
}

/// @nodoc
class __$$_GameSucceededStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameSucceededState>
    implements _$$_GameSucceededStateCopyWith<$Res> {
  __$$_GameSucceededStateCopyWithImpl(
      _$_GameSucceededState _value, $Res Function(_$_GameSucceededState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
  }) {
    return _then(_$_GameSucceededState(
      null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GameModelCopyWith<$Res> get game {
    return $GameModelCopyWith<$Res>(_value.game, (value) {
      return _then(_value.copyWith(game: value));
    });
  }
}

/// @nodoc

class _$_GameSucceededState extends _GameSucceededState {
  const _$_GameSucceededState(this.game) : super._();

  @override
  final GameModel game;

  @override
  String toString() {
    return 'GameState.succeeded(game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameSucceededState &&
            (identical(other.game, game) || other.game == game));
  }

  @override
  int get hashCode => Object.hash(runtimeType, game);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameSucceededStateCopyWith<_$_GameSucceededState> get copyWith =>
      __$$_GameSucceededStateCopyWithImpl<_$_GameSucceededState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(GameModel game) succeeded,
    required TResult Function(String message) failed,
  }) {
    return succeeded(game);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(GameModel game)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return succeeded?.call(game);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(GameModel game)? succeeded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(game);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameInitialState value) initial,
    required TResult Function(_GamePendingState value) pending,
    required TResult Function(_GameSucceededState value) succeeded,
    required TResult Function(_GameFailedState value) failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameInitialState value)? initial,
    TResult? Function(_GamePendingState value)? pending,
    TResult? Function(_GameSucceededState value)? succeeded,
    TResult? Function(_GameFailedState value)? failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameInitialState value)? initial,
    TResult Function(_GamePendingState value)? pending,
    TResult Function(_GameSucceededState value)? succeeded,
    TResult Function(_GameFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class _GameSucceededState extends GameState {
  const factory _GameSucceededState(final GameModel game) =
      _$_GameSucceededState;
  const _GameSucceededState._() : super._();

  GameModel get game;
  @JsonKey(ignore: true)
  _$$_GameSucceededStateCopyWith<_$_GameSucceededState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameFailedStateCopyWith<$Res> {
  factory _$$_GameFailedStateCopyWith(
          _$_GameFailedState value, $Res Function(_$_GameFailedState) then) =
      __$$_GameFailedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_GameFailedStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameFailedState>
    implements _$$_GameFailedStateCopyWith<$Res> {
  __$$_GameFailedStateCopyWithImpl(
      _$_GameFailedState _value, $Res Function(_$_GameFailedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_GameFailedState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GameFailedState extends _GameFailedState {
  const _$_GameFailedState(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'GameState.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameFailedState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameFailedStateCopyWith<_$_GameFailedState> get copyWith =>
      __$$_GameFailedStateCopyWithImpl<_$_GameFailedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function(GameModel game) succeeded,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function(GameModel game)? succeeded,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function(GameModel game)? succeeded,
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
    required TResult Function(_GameInitialState value) initial,
    required TResult Function(_GamePendingState value) pending,
    required TResult Function(_GameSucceededState value) succeeded,
    required TResult Function(_GameFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GameInitialState value)? initial,
    TResult? Function(_GamePendingState value)? pending,
    TResult? Function(_GameSucceededState value)? succeeded,
    TResult? Function(_GameFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameInitialState value)? initial,
    TResult Function(_GamePendingState value)? pending,
    TResult Function(_GameSucceededState value)? succeeded,
    TResult Function(_GameFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _GameFailedState extends GameState {
  const factory _GameFailedState(final String message) = _$_GameFailedState;
  const _GameFailedState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_GameFailedStateCopyWith<_$_GameFailedState> get copyWith =>
      throw _privateConstructorUsedError;
}
