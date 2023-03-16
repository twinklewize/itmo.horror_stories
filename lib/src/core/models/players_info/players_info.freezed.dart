// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'players_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayersInfoModel {
  Id get playerId => throw _privateConstructorUsedError;
  List<PlayerModel> get players => throw _privateConstructorUsedError;
  Id? get masterId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayersInfoModelCopyWith<PlayersInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayersInfoModelCopyWith<$Res> {
  factory $PlayersInfoModelCopyWith(
          PlayersInfoModel value, $Res Function(PlayersInfoModel) then) =
      _$PlayersInfoModelCopyWithImpl<$Res, PlayersInfoModel>;
  @useResult
  $Res call({Id playerId, List<PlayerModel> players, Id? masterId});
}

/// @nodoc
class _$PlayersInfoModelCopyWithImpl<$Res, $Val extends PlayersInfoModel>
    implements $PlayersInfoModelCopyWith<$Res> {
  _$PlayersInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? players = null,
    Object? masterId = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as Id?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayersInfoModelCopyWith<$Res>
    implements $PlayersInfoModelCopyWith<$Res> {
  factory _$$_PlayersInfoModelCopyWith(
          _$_PlayersInfoModel value, $Res Function(_$_PlayersInfoModel) then) =
      __$$_PlayersInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Id playerId, List<PlayerModel> players, Id? masterId});
}

/// @nodoc
class __$$_PlayersInfoModelCopyWithImpl<$Res>
    extends _$PlayersInfoModelCopyWithImpl<$Res, _$_PlayersInfoModel>
    implements _$$_PlayersInfoModelCopyWith<$Res> {
  __$$_PlayersInfoModelCopyWithImpl(
      _$_PlayersInfoModel _value, $Res Function(_$_PlayersInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? players = null,
    Object? masterId = freezed,
  }) {
    return _then(_$_PlayersInfoModel(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as Id?,
    ));
  }
}

/// @nodoc

class _$_PlayersInfoModel extends _PlayersInfoModel {
  const _$_PlayersInfoModel(
      {required this.playerId,
      final List<PlayerModel> players = const [],
      this.masterId = null})
      : _players = players,
        super._();

  @override
  final Id playerId;
  final List<PlayerModel> _players;
  @override
  @JsonKey()
  List<PlayerModel> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final Id? masterId;

  @override
  String toString() {
    return 'PlayersInfoModel(playerId: $playerId, players: $players, masterId: $masterId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayersInfoModel &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId,
      const DeepCollectionEquality().hash(_players), masterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayersInfoModelCopyWith<_$_PlayersInfoModel> get copyWith =>
      __$$_PlayersInfoModelCopyWithImpl<_$_PlayersInfoModel>(this, _$identity);
}

abstract class _PlayersInfoModel extends PlayersInfoModel {
  const factory _PlayersInfoModel(
      {required final Id playerId,
      final List<PlayerModel> players,
      final Id? masterId}) = _$_PlayersInfoModel;
  const _PlayersInfoModel._() : super._();

  @override
  Id get playerId;
  @override
  List<PlayerModel> get players;
  @override
  Id? get masterId;
  @override
  @JsonKey(ignore: true)
  _$$_PlayersInfoModelCopyWith<_$_PlayersInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
