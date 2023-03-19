import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/features/auth/data/repositories/auth_repository.dart';
import 'package:horror_stories/src/features/main/data/repositories/rooms_repository.dart';
import 'package:horror_stories/src/features/main/presentation/widgets/toast.dart';
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
      final room = await roomsRepository.createRoom(
        roomInfo: event.roomInfo,
        nickname: getIt.get<AuthRepository>().getCachedSession()?.nickname ?? '',
      );
      emit(RoomState.succeeded(room));
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }

  Future<void> _joinRoom(
    _RoomJoinEvent event,
    Emitter<RoomState> emit,
  ) async {
    emit(const RoomState.pending());
    try {
      final room = await roomsRepository.joinRoom(
        nickname: event.userNickname,
        roomInfo: event.roomInfo,
      );

      emit(RoomState.succeeded(room));
    } catch (e) {
      emit(const RoomState.failed('Произошла ошибка'));
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }

  Future<void> _leaveRoom(
    _RoomLeaveEvent event,
    Emitter<RoomState> emit,
  ) async {
    try {
      await roomsRepository.leaveRoom(roomCode: event.roomCode);

      emit(const RoomState.initial());
    } catch (e) {
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }

  Future<void> _updateRoom(
    _RoomUpdateEvent event,
    Emitter<RoomState> emit,
  ) async {
    try {
      final room = state.room;
      if (room != null) {
        final newRoom = await roomsRepository.updateRoom(
          player: state.room!.players.firstWhere((element) => element.isPlayer),
          roomInfo: room.roomInfo,
        );
        emit(RoomState.succeeded(newRoom));
      }
    } catch (e) {
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }
}
