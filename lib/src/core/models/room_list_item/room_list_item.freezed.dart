// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomListItemModel {
  RoomInfoModel get roomInfo => throw _privateConstructorUsedError;
  int get playersCount => throw _privateConstructorUsedError;
  bool get isGameStarted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomListItemModelCopyWith<RoomListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomListItemModelCopyWith<$Res> {
  factory $RoomListItemModelCopyWith(
          RoomListItemModel value, $Res Function(RoomListItemModel) then) =
      _$RoomListItemModelCopyWithImpl<$Res, RoomListItemModel>;
  @useResult
  $Res call({RoomInfoModel roomInfo, int playersCount, bool isGameStarted});

  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class _$RoomListItemModelCopyWithImpl<$Res, $Val extends RoomListItemModel>
    implements $RoomListItemModelCopyWith<$Res> {
  _$RoomListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? playersCount = null,
    Object? isGameStarted = null,
  }) {
    return _then(_value.copyWith(
      roomInfo: null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_RoomListItemModelCopyWith<$Res>
    implements $RoomListItemModelCopyWith<$Res> {
  factory _$$_RoomListItemModelCopyWith(_$_RoomListItemModel value,
          $Res Function(_$_RoomListItemModel) then) =
      __$$_RoomListItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RoomInfoModel roomInfo, int playersCount, bool isGameStarted});

  @override
  $RoomInfoModelCopyWith<$Res> get roomInfo;
}

/// @nodoc
class __$$_RoomListItemModelCopyWithImpl<$Res>
    extends _$RoomListItemModelCopyWithImpl<$Res, _$_RoomListItemModel>
    implements _$$_RoomListItemModelCopyWith<$Res> {
  __$$_RoomListItemModelCopyWithImpl(
      _$_RoomListItemModel _value, $Res Function(_$_RoomListItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomInfo = null,
    Object? playersCount = null,
    Object? isGameStarted = null,
  }) {
    return _then(_$_RoomListItemModel(
      roomInfo: null == roomInfo
          ? _value.roomInfo
          : roomInfo // ignore: cast_nullable_to_non_nullable
              as RoomInfoModel,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isGameStarted: null == isGameStarted
          ? _value.isGameStarted
          : isGameStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RoomListItemModel extends _RoomListItemModel {
  const _$_RoomListItemModel(
      {required this.roomInfo,
      required this.playersCount,
      this.isGameStarted = false})
      : super._();

  @override
  final RoomInfoModel roomInfo;
  @override
  final int playersCount;
  @override
  @JsonKey()
  final bool isGameStarted;

  @override
  String toString() {
    return 'RoomListItemModel(roomInfo: $roomInfo, playersCount: $playersCount, isGameStarted: $isGameStarted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomListItemModel &&
            (identical(other.roomInfo, roomInfo) ||
                other.roomInfo == roomInfo) &&
            (identical(other.playersCount, playersCount) ||
                other.playersCount == playersCount) &&
            (identical(other.isGameStarted, isGameStarted) ||
                other.isGameStarted == isGameStarted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, roomInfo, playersCount, isGameStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomListItemModelCopyWith<_$_RoomListItemModel> get copyWith =>
      __$$_RoomListItemModelCopyWithImpl<_$_RoomListItemModel>(
          this, _$identity);
}

abstract class _RoomListItemModel extends RoomListItemModel {
  const factory _RoomListItemModel(
      {required final RoomInfoModel roomInfo,
      required final int playersCount,
      final bool isGameStarted}) = _$_RoomListItemModel;
  const _RoomListItemModel._() : super._();

  @override
  RoomInfoModel get roomInfo;
  @override
  int get playersCount;
  @override
  bool get isGameStarted;
  @override
  @JsonKey(ignore: true)
  _$$_RoomListItemModelCopyWith<_$_RoomListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
