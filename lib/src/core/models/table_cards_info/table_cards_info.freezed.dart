// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_cards_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableCardsInfoModel {
  List<TableCardModel> get tableCards => throw _privateConstructorUsedError;
  List<VoteModel> get votes => throw _privateConstructorUsedError;
  Id? get selectedCardId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableCardsInfoModelCopyWith<TableCardsInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableCardsInfoModelCopyWith<$Res> {
  factory $TableCardsInfoModelCopyWith(
          TableCardsInfoModel value, $Res Function(TableCardsInfoModel) then) =
      _$TableCardsInfoModelCopyWithImpl<$Res, TableCardsInfoModel>;
  @useResult
  $Res call(
      {List<TableCardModel> tableCards,
      List<VoteModel> votes,
      Id? selectedCardId});
}

/// @nodoc
class _$TableCardsInfoModelCopyWithImpl<$Res, $Val extends TableCardsInfoModel>
    implements $TableCardsInfoModelCopyWith<$Res> {
  _$TableCardsInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableCards = null,
    Object? votes = null,
    Object? selectedCardId = freezed,
  }) {
    return _then(_value.copyWith(
      tableCards: null == tableCards
          ? _value.tableCards
          : tableCards // ignore: cast_nullable_to_non_nullable
              as List<TableCardModel>,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<VoteModel>,
      selectedCardId: freezed == selectedCardId
          ? _value.selectedCardId
          : selectedCardId // ignore: cast_nullable_to_non_nullable
              as Id?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableCardsInfoModelCopyWith<$Res>
    implements $TableCardsInfoModelCopyWith<$Res> {
  factory _$$_TableCardsInfoModelCopyWith(_$_TableCardsInfoModel value,
          $Res Function(_$_TableCardsInfoModel) then) =
      __$$_TableCardsInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TableCardModel> tableCards,
      List<VoteModel> votes,
      Id? selectedCardId});
}

/// @nodoc
class __$$_TableCardsInfoModelCopyWithImpl<$Res>
    extends _$TableCardsInfoModelCopyWithImpl<$Res, _$_TableCardsInfoModel>
    implements _$$_TableCardsInfoModelCopyWith<$Res> {
  __$$_TableCardsInfoModelCopyWithImpl(_$_TableCardsInfoModel _value,
      $Res Function(_$_TableCardsInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableCards = null,
    Object? votes = null,
    Object? selectedCardId = freezed,
  }) {
    return _then(_$_TableCardsInfoModel(
      tableCards: null == tableCards
          ? _value._tableCards
          : tableCards // ignore: cast_nullable_to_non_nullable
              as List<TableCardModel>,
      votes: null == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<VoteModel>,
      selectedCardId: freezed == selectedCardId
          ? _value.selectedCardId
          : selectedCardId // ignore: cast_nullable_to_non_nullable
              as Id?,
    ));
  }
}

/// @nodoc

class _$_TableCardsInfoModel extends _TableCardsInfoModel {
  const _$_TableCardsInfoModel(
      {required final List<TableCardModel> tableCards,
      final List<VoteModel> votes = const [],
      this.selectedCardId = null})
      : _tableCards = tableCards,
        _votes = votes,
        super._();

  final List<TableCardModel> _tableCards;
  @override
  List<TableCardModel> get tableCards {
    if (_tableCards is EqualUnmodifiableListView) return _tableCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableCards);
  }

  final List<VoteModel> _votes;
  @override
  @JsonKey()
  List<VoteModel> get votes {
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votes);
  }

  @override
  @JsonKey()
  final Id? selectedCardId;

  @override
  String toString() {
    return 'TableCardsInfoModel(tableCards: $tableCards, votes: $votes, selectedCardId: $selectedCardId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableCardsInfoModel &&
            const DeepCollectionEquality()
                .equals(other._tableCards, _tableCards) &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            (identical(other.selectedCardId, selectedCardId) ||
                other.selectedCardId == selectedCardId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tableCards),
      const DeepCollectionEquality().hash(_votes),
      selectedCardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableCardsInfoModelCopyWith<_$_TableCardsInfoModel> get copyWith =>
      __$$_TableCardsInfoModelCopyWithImpl<_$_TableCardsInfoModel>(
          this, _$identity);
}

abstract class _TableCardsInfoModel extends TableCardsInfoModel {
  const factory _TableCardsInfoModel(
      {required final List<TableCardModel> tableCards,
      final List<VoteModel> votes,
      final Id? selectedCardId}) = _$_TableCardsInfoModel;
  const _TableCardsInfoModel._() : super._();

  @override
  List<TableCardModel> get tableCards;
  @override
  List<VoteModel> get votes;
  @override
  Id? get selectedCardId;
  @override
  @JsonKey(ignore: true)
  _$$_TableCardsInfoModelCopyWith<_$_TableCardsInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
