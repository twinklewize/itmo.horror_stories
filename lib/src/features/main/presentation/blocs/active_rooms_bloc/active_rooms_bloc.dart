import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/features/main/data/repositories/rooms_repository.dart';
import 'package:injectable/injectable.dart';

part 'active_rooms_event.dart';
part 'active_rooms_state.dart';
part 'active_rooms_bloc.freezed.dart';

@singleton
class ActiveRoomsBloc extends Bloc<ActiveRoomsEvent, ActiveRoomsState> {
  final RoomsRepository roomsRepository;
  ActiveRoomsBloc(this.roomsRepository) : super(const _ActiveRoomsInitialState()) {
    on<ActiveRoomsEvent>(
      (event, emit) => event.map(
        getActiveRooms: (event) => _getActiveRooms(event, emit),
        updateActiveRooms: (event) => _updateActiveRooms(event, emit),
      ),
    );
  }

  Future<void> _getActiveRooms(
    _ActiveRoomsGetEvent event,
    Emitter<ActiveRoomsState> emit,
  ) async {
    emit(const ActiveRoomsState.pending());
    try {
      final payload = await roomsRepository.getActiveRooms();
      emit(ActiveRoomsState.succeeded(payload.activeRooms));
    } catch (e) {
      emit(const ActiveRoomsState.failed('Произошла ошибка'));
    }
  }

  Future<void> _updateActiveRooms(
    _ActiveRoomsUpdateEvent event,
    Emitter<ActiveRoomsState> emit,
  ) async {
    try {
      final payload = await roomsRepository.getActiveRooms();
      emit(ActiveRoomsState.succeeded(payload.activeRooms));
    } catch (e) {
      emit(const ActiveRoomsState.failed('Произошла ошибка'));
    }
  }
}
