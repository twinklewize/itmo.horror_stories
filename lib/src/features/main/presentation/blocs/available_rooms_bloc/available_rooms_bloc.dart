import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/features/main/data/repositories/rooms_repository.dart';
import 'package:injectable/injectable.dart';

import '../../widgets/toast.dart';

part 'available_rooms_event.dart';
part 'available_rooms_state.dart';
part 'available_rooms_bloc.freezed.dart';

@singleton
class AvailableRoomsBloc extends Bloc<AvailableRoomsEvent, AvailableRoomsState> {
  final RoomsRepository roomsRepository;
  AvailableRoomsBloc(this.roomsRepository) : super(const _AvailableRoomsInitialState()) {
    on<AvailableRoomsEvent>(
      (event, emit) => event.map(
        getAvailableRooms: (event) => _getAvailableRooms(event, emit),
        updateAvailableRooms: (event) => _updateAvailableRooms(event, emit),
      ),
    );
  }

  Future<void> _getAvailableRooms(
    _AvailableRoomsGetEvent event,
    Emitter<AvailableRoomsState> emit,
  ) async {
    emit(const AvailableRoomsState.pending());
    try {
      final availableRooms = await roomsRepository.getAvailableRooms();
      emit(AvailableRoomsState.succeeded(availableRooms));
    } catch (e) {
      emit(const AvailableRoomsState.failed('Произошла ошибка'));
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }

  Future<void> _updateAvailableRooms(
    _AvailableRoomsUpdateEvent event,
    Emitter<AvailableRoomsState> emit,
  ) async {
    try {
      final availableRooms = await roomsRepository.getAvailableRooms();
      emit(AvailableRoomsState.succeeded(availableRooms));
    } catch (e) {
      //
    }
  }
}
