// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableCardModel {
  Id get tableCardId => throw _privateConstructorUsedError;
  CardModel get card => throw _privateConstructorUsedError;
  dynamic get isOnTable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableCardModelCopyWith<TableCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableCardModelCopyWith<$Res> {
  factory $TableCardModelCopyWith(
          TableCardModel value, $Res Function(TableCardModel) then) =
      _$TableCardModelCopyWithImpl<$Res, TableCardModel>;
  @useResult
  $Res call({Id tableCardId, CardModel card, dynamic isOnTable});

  $CardModelCopyWith<$Res> get card;
}

/// @nodoc
class _$TableCardModelCopyWithImpl<$Res, $Val extends TableCardModel>
    implements $TableCardModelCopyWith<$Res> {
  _$TableCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableCardId = null,
    Object? card = null,
    Object? isOnTable = freezed,
  }) {
    return _then(_value.copyWith(
      tableCardId: null == tableCardId
          ? _value.tableCardId
          : tableCardId // ignore: cast_nullable_to_non_nullable
              as Id,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardModel,
      isOnTable: freezed == isOnTable
          ? _value.isOnTable
          : isOnTable // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_TableCardModelCopyWith<$Res>
    implements $TableCardModelCopyWith<$Res> {
  factory _$$_TableCardModelCopyWith(
          _$_TableCardModel value, $Res Function(_$_TableCardModel) then) =
      __$$_TableCardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Id tableCardId, CardModel card, dynamic isOnTable});

  @override
  $CardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$_TableCardModelCopyWithImpl<$Res>
    extends _$TableCardModelCopyWithImpl<$Res, _$_TableCardModel>
    implements _$$_TableCardModelCopyWith<$Res> {
  __$$_TableCardModelCopyWithImpl(
      _$_TableCardModel _value, $Res Function(_$_TableCardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableCardId = null,
    Object? card = null,
    Object? isOnTable = freezed,
  }) {
    return _then(_$_TableCardModel(
      tableCardId: null == tableCardId
          ? _value.tableCardId
          : tableCardId // ignore: cast_nullable_to_non_nullable
              as Id,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardModel,
      isOnTable: freezed == isOnTable ? _value.isOnTable! : isOnTable,
    ));
  }
}

/// @nodoc

class _$_TableCardModel extends _TableCardModel {
  const _$_TableCardModel(
      {required this.tableCardId, required this.card, this.isOnTable = true})
      : super._();

  @override
  final Id tableCardId;
  @override
  final CardModel card;
  @override
  @JsonKey()
  final dynamic isOnTable;

  @override
  String toString() {
    return 'TableCardModel(tableCardId: $tableCardId, card: $card, isOnTable: $isOnTable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableCardModel &&
            (identical(other.tableCardId, tableCardId) ||
                other.tableCardId == tableCardId) &&
            (identical(other.card, card) || other.card == card) &&
            const DeepCollectionEquality().equals(other.isOnTable, isOnTable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableCardId, card,
      const DeepCollectionEquality().hash(isOnTable));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableCardModelCopyWith<_$_TableCardModel> get copyWith =>
      __$$_TableCardModelCopyWithImpl<_$_TableCardModel>(this, _$identity);
}

abstract class _TableCardModel extends TableCardModel {
  const factory _TableCardModel(
      {required final Id tableCardId,
      required final CardModel card,
      final dynamic isOnTable}) = _$_TableCardModel;
  const _TableCardModel._() : super._();

  @override
  Id get tableCardId;
  @override
  CardModel get card;
  @override
  dynamic get isOnTable;
  @override
  @JsonKey(ignore: true)
  _$$_TableCardModelCopyWith<_$_TableCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
