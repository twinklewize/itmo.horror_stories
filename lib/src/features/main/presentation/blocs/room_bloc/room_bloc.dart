import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/features/auth/data/repositories/auth_repository.dart';
import 'package:horror_stories/src/features/main/data/repositories/rooms_repository.dart';
import 'package:injectable/injectable.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.freezed.dart';

@singleton
class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomsRepository roomsRepository;
  RoomBloc(this.roomsRepository) : super(const _RoomInitialState()) {
    on<RoomEvent>(
      (event, emit) => event.map(
        createRoom: (event) => _createRoom(event, emit),
        joinRoom: (event) => _joinRoom(event, emit),
        leaveRoom: (event) => _leaveRoom(event, emit),
        updateRoom: (event) => _updateRoom(event, emit),
      ),
    );
  }

  Future<void> _createRoom(
    _RoomCreateEvent event,
    Emitter<RoomState> emit,
  ) async {
    emit(const RoomState.pending());
    try {
      final payload = await roomsRepository.createRoom(event.roomInfo);
      final playerId = payload.playerId;
      final userNickname = getIt.get<AuthRepository>().getCachedSession()?.nickname;

      final room = RoomModel(
        roomInfo: event.roomInfo,
        playersInfo: PlayersInfoModel(
          players: [
            PlayerModel(
              playerId: playerId,
              nickname: userNickname ?? '',
            )
          ],
          playerId: playerId,
          masterId: null,
        ),
        isGameStarted: false,
      );
      emit(RoomState.succeeded(room));
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
    }
  }

  Future<void> _joinRoom(
    _RoomJoinEvent event,
    Emitter<RoomState> emit,
  ) async {
    emit(const RoomState.pending());
    try {
      final payload = await roomsRepository.joinRoom(event.roomInfo.roomCode);
      final masterId = payload.masterId;
      final playerId = payload.playerId;
      final otherPlayers = payload.otherPlayers;

      final userNickname = event.userNickname;
      final players = [...otherPlayers, PlayerModel(playerId: playerId, nickname: userNickname)];

      final room = RoomModel(
        roomInfo: event.roomInfo,
        playersInfo: PlayersInfoModel(
          playerId: playerId,
          players: players,
          masterId: masterId,
        ),
        isGameStarted: false,
      );

      emit(RoomState.succeeded(room));
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
    }
  }

  Future<void> _leaveRoom(
    _RoomLeaveEvent event,
    Emitter<RoomState> emit,
  ) async {
    try {
      final roomCode = state.room?.roomInfo.roomCode;
      if (roomCode != null) {
        await roomsRepository.leaveRoom(roomCode: roomCode);
      }
      emit(const RoomState.initial());
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
    }
  }

  Future<void> _updateRoom(
    _RoomUpdateEvent event,
    Emitter<RoomState> emit,
  ) async {
    try {
      final roomCode = state.room?.roomInfo.roomCode;
      if (roomCode != null) {
        await roomsRepository.updateRoom(roomCode);
      }

      // emit(RoomState.succeeded(room));
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
    }
  }
}
