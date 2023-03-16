// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomInfoModel {
  int get roomCode => throw _privateConstructorUsedError;
  int get moveTime => throw _privateConstructorUsedError;
  int get placesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomInfoModelCopyWith<RoomInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomInfoModelCopyWith<$Res> {
  factory $RoomInfoModelCopyWith(
          RoomInfoModel value, $Res Function(RoomInfoModel) then) =
      _$RoomInfoModelCopyWithImpl<$Res, RoomInfoModel>;
  @useResult
  $Res call({int roomCode, int moveTime, int placesCount});
}

/// @nodoc
class _$RoomInfoModelCopyWithImpl<$Res, $Val extends RoomInfoModel>
    implements $RoomInfoModelCopyWith<$Res> {
  _$RoomInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomCode = null,
    Object? moveTime = null,
    Object? placesCount = null,
  }) {
    return _then(_value.copyWith(
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as int,
      moveTime: null == moveTime
          ? _value.moveTime
          : moveTime // ignore: cast_nullable_to_non_nullable
              as int,
      placesCount: null == placesCount
          ? _value.placesCount
          : placesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomInfoModelCopyWith<$Res>
    implements $RoomInfoModelCopyWith<$Res> {
  factory _$$_RoomInfoModelCopyWith(
          _$_RoomInfoModel value, $Res Function(_$_RoomInfoModel) then) =
      __$$_RoomInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int roomCode, int moveTime, int placesCount});
}

/// @nodoc
class __$$_RoomInfoModelCopyWithImpl<$Res>
    extends _$RoomInfoModelCopyWithImpl<$Res, _$_RoomInfoModel>
    implements _$$_RoomInfoModelCopyWith<$Res> {
  __$$_RoomInfoModelCopyWithImpl(
      _$_RoomInfoModel _value, $Res Function(_$_RoomInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomCode = null,
    Object? moveTime = null,
    Object? placesCount = null,
  }) {
    return _then(_$_RoomInfoModel(
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as int,
      moveTime: null == moveTime
          ? _value.moveTime
          : moveTime // ignore: cast_nullable_to_non_nullable
              as int,
      placesCount: null == placesCount
          ? _value.placesCount
          : placesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RoomInfoModel extends _RoomInfoModel {
  const _$_RoomInfoModel(
      {required this.roomCode,
      required this.moveTime,
      required this.placesCount})
      : super._();

  @override
  final int roomCode;
  @override
  final int moveTime;
  @override
  final int placesCount;

  @override
  String toString() {
    return 'RoomInfoModel(roomCode: $roomCode, moveTime: $moveTime, placesCount: $placesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomInfoModel &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            (identical(other.moveTime, moveTime) ||
                other.moveTime == moveTime) &&
            (identical(other.placesCount, placesCount) ||
                other.placesCount == placesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomCode, moveTime, placesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomInfoModelCopyWith<_$_RoomInfoModel> get copyWith =>
      __$$_RoomInfoModelCopyWithImpl<_$_RoomInfoModel>(this, _$identity);
}

abstract class _RoomInfoModel extends RoomInfoModel {
  const factory _RoomInfoModel(
      {required final int roomCode,
      required final int moveTime,
      required final int placesCount}) = _$_RoomInfoModel;
  const _RoomInfoModel._() : super._();

  @override
  int get roomCode;
  @override
  int get moveTime;
  @override
  int get placesCount;
  @override
  @JsonKey(ignore: true)
  _$$_RoomInfoModelCopyWith<_$_RoomInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
