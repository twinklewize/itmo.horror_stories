import 'package:horror_stories/src/core/exceptions/app_exception.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/logger/logger.dart';
import 'package:horror_stories/src/features/main/data/payloads/create_room_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/get_active_rooms_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/get_available_rooms_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/join_room_payload.dart';
import 'package:injectable/injectable.dart';

import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart';
import 'package:logger/logger.dart';

import '../payloads/update_room_payload.dart';

@singleton
class RoomsRepository {
  final DioBackendClient backendClient;

  RoomsRepository(this.backendClient);

  Future<GetAvailableRoomsPayload> getAvailableRooms() async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'get_available_rooms',
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      final roomCodes = result[0]['roomCode'] as List<int>;
      final moveTimes = result[0]['moveTime'] as List<int>;
      final placesCounts = result[0]['placesCount'] as List<int>;
      final playersCount = result[0]['playersCounts'] as List<int>;
      final List<RoomListItemModel> availableRooms = [];
      for (var i = 0; i < roomCodes.length; i++) {
        availableRooms.add(RoomListItemModel(
            roomInfo: RoomInfoModel(
              moveTime: moveTimes[i],
              placesCount: placesCounts[i],
              roomCode: roomCodes[i],
            ),
            playersCount: playersCount[i]));
      }

      getIt.get<AppLogger>().logger.log(Level.info, availableRooms);
      return GetAvailableRoomsPayload(availableRooms: availableRooms);
    }
    throw AppException('No results');
  }

  Future<GetActiveRoomsPayload> getActiveRooms() async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'get_active_rooms',
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final roomCodes = result[0]['roomCode'] as List<int>;
      final moveTimes = result[0]['moveTime'] as List<int>;
      final placesCounts = result[0]['placesCount'] as List<int>;
      final playersCount = result[0]['playersCounts'] as List<int>;
      final List<RoomListItemModel> activeRooms = [];
      for (var i = 0; i < roomCodes.length; i++) {
        activeRooms.add(RoomListItemModel(
            roomInfo: RoomInfoModel(
              moveTime: moveTimes[i],
              placesCount: placesCounts[i],
              roomCode: roomCodes[i],
            ),
            playersCount: playersCount[i]));
      }

      return GetActiveRoomsPayload(activeRooms: activeRooms);
    }
    throw AppException('No results');
  }

  // возвращает playerId
  Future<CreateRoomPayload> createRoom(RoomInfoModel roomInfo) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'create_room',
      queryParameters: {
        'p2': roomInfo.roomCode.toString(),
        'p3': roomInfo.moveTime.toString(),
        'p4': roomInfo.placesCount.toString(),
      },
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as int?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      return CreateRoomPayload(playerId: Id.fromInt(result));
    }
    throw AppException('No results');
  }

  Future<void> leaveRoom({required int roomCode}) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'leave_game',
      queryParameters: {'p2': roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
    }
    throw AppException('No results');
  }

  Future<JoinRoomPayload> joinRoom(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'join_room',
      queryParameters: {'p2': roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
    }
    throw AppException('No results');
  }

  Future<UpdateRoomPayload> updateRoom(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'update_room',
      queryParameters: {'p2': roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
    }
    throw AppException('No results');
  }
}
