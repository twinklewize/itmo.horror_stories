// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomModel {
  RoomInfoModel get roomInfo => throw _privateConstructorUsedError;
  List<PlayerModel> get players => throw _privateConstructorUsedError;
  bool get isGameStarted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call(
      {RoomInfoModel roomInfo, List<PlayerModel> players, bool isGameStarted});

  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? players = null,
    Object? isGameStarted = null,
  }) {
    return _then(_value.copyWith(
      roomInfo: null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
      isGameStarted: null == isGameStarted
          ? _value.isGameStarted
          : isGameStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomInfoModelCopyWith<$Res> get roomInfo {
    return $RoomInfoModelCopyWith<$Res>(_value.roomInfo, (value) {
      return _then(_value.copyWith(roomInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoomModelCopyWith<$Res> implements $RoomModelCopyWith<$Res> {
  factory _$$_RoomModelCopyWith(
          _$_RoomModel value, $Res Function(_$_RoomModel) then) =
      __$$_RoomModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RoomInfoModel roomInfo, List<PlayerModel> players, bool isGameStarted});

  @override
  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class __$$_RoomModelCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$_RoomModel>
    implements _$$_RoomModelCopyWith<$Res> {
  __$$_RoomModelCopyWithImpl(
      _$_RoomModel _value, $Res Function(_$_RoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? players = null,
    Object? isGameStarted = null,
  }) {
    return _then(_$_RoomModel(
      roomInfo: null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
      isGameStarted: null == isGameStarted
          ? _value.isGameStarted
          : isGameStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RoomModel extends _RoomModel {
  const _$_RoomModel(
      {required this.roomInfo,
      required final List<PlayerModel> players,
      this.isGameStarted = false})
      : _players = players,
        super._();

  @override
  final RoomInfoModel roomInfo;
  final List<PlayerModel> _players;
  @override
  List<PlayerModel> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final bool isGameStarted;

  @override
  String toString() {
    return 'RoomModel(roomInfo: $roomInfo, players: $players, isGameStarted: $isGameStarted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomModel &&
            (identical(other.roomInfo, roomInfo) ||
                other.roomInfo == roomInfo) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.isGameStarted, isGameStarted) ||
                other.isGameStarted == isGameStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomInfo,
      const DeepCollectionEquality().hash(_players), isGameStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomModelCopyWith<_$_RoomModel> get copyWith =>
      __$$_RoomModelCopyWithImpl<_$_RoomModel>(this, _$identity);
}

abstract class _RoomModel extends RoomModel {
  const factory _RoomModel(
      {required final RoomInfoModel roomInfo,
      required final List<PlayerModel> players,
      final bool isGameStarted}) = _$_RoomModel;
  const _RoomModel._() : super._();

  @override
  RoomInfoModel get roomInfo;
  @override
  List<PlayerModel> get players;
  @override
  bool get isGameStarted;
  @override
  @JsonKey(ignore: true)
  _$$_RoomModelCopyWith<_$_RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
