// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoveModel {
  int get roundNumber => throw _privateConstructorUsedError;
  GamePhase get phase => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  int? get cardsToRemoveCount => throw _privateConstructorUsedError;
  bool get isGameOver => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoveModelCopyWith<MoveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveModelCopyWith<$Res> {
  factory $MoveModelCopyWith(MoveModel value, $Res Function(MoveModel) then) =
      _$MoveModelCopyWithImpl<$Res, MoveModel>;
  @useResult
  $Res call(
      {int roundNumber,
      GamePhase phase,
      int remainingTime,
      int? cardsToRemoveCount,
      bool isGameOver});
}

/// @nodoc
class _$MoveModelCopyWithImpl<$Res, $Val extends MoveModel>
    implements $MoveModelCopyWith<$Res> {
  _$MoveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundNumber = null,
    Object? phase = null,
    Object? remainingTime = null,
    Object? cardsToRemoveCount = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_value.copyWith(
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      cardsToRemoveCount: freezed == cardsToRemoveCount
          ? _value.cardsToRemoveCount
          : cardsToRemoveCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoveModelCopyWith<$Res> implements $MoveModelCopyWith<$Res> {
  factory _$$_MoveModelCopyWith(
          _$_MoveModel value, $Res Function(_$_MoveModel) then) =
      __$$_MoveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roundNumber,
      GamePhase phase,
      int remainingTime,
      int? cardsToRemoveCount,
      bool isGameOver});
}

/// @nodoc
class __$$_MoveModelCopyWithImpl<$Res>
    extends _$MoveModelCopyWithImpl<$Res, _$_MoveModel>
    implements _$$_MoveModelCopyWith<$Res> {
  __$$_MoveModelCopyWithImpl(
      _$_MoveModel _value, $Res Function(_$_MoveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundNumber = null,
    Object? phase = null,
    Object? remainingTime = null,
    Object? cardsToRemoveCount = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_$_MoveModel(
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      cardsToRemoveCount: freezed == cardsToRemoveCount
          ? _value.cardsToRemoveCount
          : cardsToRemoveCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MoveModel extends _MoveModel {
  const _$_MoveModel(
      {this.roundNumber = 1,
      this.phase = GamePhase.hints,
      required this.remainingTime,
      this.cardsToRemoveCount = null,
      this.isGameOver = false})
      : super._();

  @override
  @JsonKey()
  final int roundNumber;
  @override
  @JsonKey()
  final GamePhase phase;
  @override
  final int remainingTime;
  @override
  @JsonKey()
  final int? cardsToRemoveCount;
  @override
  @JsonKey()
  final bool isGameOver;

  @override
  String toString() {
    return 'MoveModel(roundNumber: $roundNumber, phase: $phase, remainingTime: $remainingTime, cardsToRemoveCount: $cardsToRemoveCount, isGameOver: $isGameOver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoveModel &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.cardsToRemoveCount, cardsToRemoveCount) ||
                other.cardsToRemoveCount == cardsToRemoveCount) &&
            (identical(other.isGameOver, isGameOver) ||
                other.isGameOver == isGameOver));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roundNumber, phase,
      remainingTime, cardsToRemoveCount, isGameOver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoveModelCopyWith<_$_MoveModel> get copyWith =>
      __$$_MoveModelCopyWithImpl<_$_MoveModel>(this, _$identity);
}

abstract class _MoveModel extends MoveModel {
  const factory _MoveModel(
      {final int roundNumber,
      final GamePhase phase,
      required final int remainingTime,
      final int? cardsToRemoveCount,
      final bool isGameOver}) = _$_MoveModel;
  const _MoveModel._() : super._();

  @override
  int get roundNumber;
  @override
  GamePhase get phase;
  @override
  int get remainingTime;
  @override
  int? get cardsToRemoveCount;
  @override
  bool get isGameOver;
  @override
  @JsonKey(ignore: true)
  _$$_MoveModelCopyWith<_$_MoveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
