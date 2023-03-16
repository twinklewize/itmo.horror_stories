// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoteModel {
  Id get playerId => throw _privateConstructorUsedError;
  Id get tableCardId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoteModelCopyWith<VoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteModelCopyWith<$Res> {
  factory $VoteModelCopyWith(VoteModel value, $Res Function(VoteModel) then) =
      _$VoteModelCopyWithImpl<$Res, VoteModel>;
  @useResult
  $Res call({Id playerId, Id tableCardId});
}

/// @nodoc
class _$VoteModelCopyWithImpl<$Res, $Val extends VoteModel>
    implements $VoteModelCopyWith<$Res> {
  _$VoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? tableCardId = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      tableCardId: null == tableCardId
          ? _value.tableCardId
          : tableCardId // ignore: cast_nullable_to_non_nullable
              as Id,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoteModelCopyWith<$Res> implements $VoteModelCopyWith<$Res> {
  factory _$$_VoteModelCopyWith(
          _$_VoteModel value, $Res Function(_$_VoteModel) then) =
      __$$_VoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Id playerId, Id tableCardId});
}

/// @nodoc
class __$$_VoteModelCopyWithImpl<$Res>
    extends _$VoteModelCopyWithImpl<$Res, _$_VoteModel>
    implements _$$_VoteModelCopyWith<$Res> {
  __$$_VoteModelCopyWithImpl(
      _$_VoteModel _value, $Res Function(_$_VoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? tableCardId = null,
  }) {
    return _then(_$_VoteModel(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      tableCardId: null == tableCardId
          ? _value.tableCardId
          : tableCardId // ignore: cast_nullable_to_non_nullable
              as Id,
    ));
  }
}

/// @nodoc

class _$_VoteModel extends _VoteModel {
  const _$_VoteModel({required this.playerId, required this.tableCardId})
      : super._();

  @override
  final Id playerId;
  @override
  final Id tableCardId;

  @override
  String toString() {
    return 'VoteModel(playerId: $playerId, tableCardId: $tableCardId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoteModel &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.tableCardId, tableCardId) ||
                other.tableCardId == tableCardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId, tableCardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoteModelCopyWith<_$_VoteModel> get copyWith =>
      __$$_VoteModelCopyWithImpl<_$_VoteModel>(this, _$identity);
}

abstract class _VoteModel extends VoteModel {
  const factory _VoteModel(
      {required final Id playerId,
      required final Id tableCardId}) = _$_VoteModel;
  const _VoteModel._() : super._();

  @override
  Id get playerId;
  @override
  Id get tableCardId;
  @override
  @JsonKey(ignore: true)
  _$$_VoteModelCopyWith<_$_VoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
