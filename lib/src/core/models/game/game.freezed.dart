// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameModel {
  RoomModel get room => throw _privateConstructorUsedError;
  MoveModel get currentMove => throw _privateConstructorUsedError;
  List<HintCardModel> get hintCards => throw _privateConstructorUsedError;
  TableCardsInfoModel get tableCardsInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call(
      {RoomModel room,
      MoveModel currentMove,
      List<HintCardModel> hintCards,
      TableCardsInfoModel tableCardsInfo});

  $RoomModelCopyWith<$Res> get room;
  $MoveModelCopyWith<$Res> get currentMove;
  $TableCardsInfoModelCopyWith<$Res> get tableCardsInfo;
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? currentMove = null,
    Object? hintCards = null,
    Object? tableCardsInfo = null,
  }) {
    return _then(_value.copyWith(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel,
      currentMove: null == currentMove
          ? _value.currentMove
          : currentMove // ignore: cast_nullable_to_non_nullable
              as MoveModel,
      hintCards: null == hintCards
          ? _value.hintCards
          : hintCards // ignore: cast_nullable_to_non_nullable
              as List<HintCardModel>,
      tableCardsInfo: null == tableCardsInfo
          ? _value.tableCardsInfo
          : tableCardsInfo // ignore: cast_nullable_to_non_nullable
              as TableCardsInfoModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res> get room {
    return $RoomModelCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MoveModelCopyWith<$Res> get currentMove {
    return $MoveModelCopyWith<$Res>(_value.currentMove, (value) {
      return _then(_value.copyWith(currentMove: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TableCardsInfoModelCopyWith<$Res> get tableCardsInfo {
    return $TableCardsInfoModelCopyWith<$Res>(_value.tableCardsInfo, (value) {
      return _then(_value.copyWith(tableCardsInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$$_GameModelCopyWith(
          _$_GameModel value, $Res Function(_$_GameModel) then) =
      __$$_GameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RoomModel room,
      MoveModel currentMove,
      List<HintCardModel> hintCards,
      TableCardsInfoModel tableCardsInfo});

  @override
  $RoomModelCopyWith<$Res> get room;
  @override
  $MoveModelCopyWith<$Res> get currentMove;
  @override
  $TableCardsInfoModelCopyWith<$Res> get tableCardsInfo;
}

/// @nodoc
class __$$_GameModelCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$_GameModel>
    implements _$$_GameModelCopyWith<$Res> {
  __$$_GameModelCopyWithImpl(
      _$_GameModel _value, $Res Function(_$_GameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? currentMove = null,
    Object? hintCards = null,
    Object? tableCardsInfo = null,
  }) {
    return _then(_$_GameModel(
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel,
      currentMove: null == currentMove
          ? _value.currentMove
          : currentMove // ignore: cast_nullable_to_non_nullable
              as MoveModel,
      hintCards: null == hintCards
          ? _value._hintCards
          : hintCards // ignore: cast_nullable_to_non_nullable
              as List<HintCardModel>,
      tableCardsInfo: null == tableCardsInfo
          ? _value.tableCardsInfo
          : tableCardsInfo // ignore: cast_nullable_to_non_nullable
              as TableCardsInfoModel,
    ));
  }
}

/// @nodoc

class _$_GameModel extends _GameModel {
  const _$_GameModel(
      {required this.room,
      required this.currentMove,
      required final List<HintCardModel> hintCards,
      required this.tableCardsInfo})
      : _hintCards = hintCards,
        super._();

  @override
  final RoomModel room;
  @override
  final MoveModel currentMove;
  final List<HintCardModel> _hintCards;
  @override
  List<HintCardModel> get hintCards {
    if (_hintCards is EqualUnmodifiableListView) return _hintCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hintCards);
  }

  @override
  final TableCardsInfoModel tableCardsInfo;

  @override
  String toString() {
    return 'GameModel(room: $room, currentMove: $currentMove, hintCards: $hintCards, tableCardsInfo: $tableCardsInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameModel &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.currentMove, currentMove) ||
                other.currentMove == currentMove) &&
            const DeepCollectionEquality()
                .equals(other._hintCards, _hintCards) &&
            (identical(other.tableCardsInfo, tableCardsInfo) ||
                other.tableCardsInfo == tableCardsInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room, currentMove,
      const DeepCollectionEquality().hash(_hintCards), tableCardsInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameModelCopyWith<_$_GameModel> get copyWith =>
      __$$_GameModelCopyWithImpl<_$_GameModel>(this, _$identity);
}

abstract class _GameModel extends GameModel {
  const factory _GameModel(
      {required final RoomModel room,
      required final MoveModel currentMove,
      required final List<HintCardModel> hintCards,
      required final TableCardsInfoModel tableCardsInfo}) = _$_GameModel;
  const _GameModel._() : super._();

  @override
  RoomModel get room;
  @override
  MoveModel get currentMove;
  @override
  List<HintCardModel> get hintCards;
  @override
  TableCardsInfoModel get tableCardsInfo;
  @override
  @JsonKey(ignore: true)
  _$$_GameModelCopyWith<_$_GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
