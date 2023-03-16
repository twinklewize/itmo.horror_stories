// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hint_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HintCardModel {
  CardModel get card => throw _privateConstructorUsedError;
  HintStatus get hintStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HintCardModelCopyWith<HintCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HintCardModelCopyWith<$Res> {
  factory $HintCardModelCopyWith(
          HintCardModel value, $Res Function(HintCardModel) then) =
      _$HintCardModelCopyWithImpl<$Res, HintCardModel>;
  @useResult
  $Res call({CardModel card, HintStatus hintStatus});

  $CardModelCopyWith<$Res> get card;
}

/// @nodoc
class _$HintCardModelCopyWithImpl<$Res, $Val extends HintCardModel>
    implements $HintCardModelCopyWith<$Res> {
  _$HintCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? hintStatus = null,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardModel,
      hintStatus: null == hintStatus
          ? _value.hintStatus
          : hintStatus // ignore: cast_nullable_to_non_nullable
              as HintStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardModelCopyWith<$Res> get card {
    return $CardModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HintCardModelCopyWith<$Res>
    implements $HintCardModelCopyWith<$Res> {
  factory _$$_HintCardModelCopyWith(
          _$_HintCardModel value, $Res Function(_$_HintCardModel) then) =
      __$$_HintCardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardModel card, HintStatus hintStatus});

  @override
  $CardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$_HintCardModelCopyWithImpl<$Res>
    extends _$HintCardModelCopyWithImpl<$Res, _$_HintCardModel>
    implements _$$_HintCardModelCopyWith<$Res> {
  __$$_HintCardModelCopyWithImpl(
      _$_HintCardModel _value, $Res Function(_$_HintCardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? hintStatus = null,
  }) {
    return _then(_$_HintCardModel(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardModel,
      hintStatus: null == hintStatus
          ? _value.hintStatus
          : hintStatus // ignore: cast_nullable_to_non_nullable
              as HintStatus,
    ));
  }
}

/// @nodoc

class _$_HintCardModel extends _HintCardModel {
  const _$_HintCardModel({required this.card, required this.hintStatus})
      : super._();

  @override
  final CardModel card;
  @override
  final HintStatus hintStatus;

  @override
  String toString() {
    return 'HintCardModel(card: $card, hintStatus: $hintStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HintCardModel &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.hintStatus, hintStatus) ||
                other.hintStatus == hintStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, card, hintStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HintCardModelCopyWith<_$_HintCardModel> get copyWith =>
      __$$_HintCardModelCopyWithImpl<_$_HintCardModel>(this, _$identity);
}

abstract class _HintCardModel extends HintCardModel {
  const factory _HintCardModel(
      {required final CardModel card,
      required final HintStatus hintStatus}) = _$_HintCardModel;
  const _HintCardModel._() : super._();

  @override
  CardModel get card;
  @override
  HintStatus get hintStatus;
  @override
  @JsonKey(ignore: true)
  _$$_HintCardModelCopyWith<_$_HintCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
