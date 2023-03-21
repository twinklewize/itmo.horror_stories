import 'package:horror_stories/src/core/exceptions/app_exception.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class RoomsRepository {
  final DioBackendClient backendClient;

  RoomsRepository(this.backendClient);

  Future<List<RoomListItemModel>> getAvailableRooms() async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'get_available_rooms',
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      throw AppException(error);
    }
    if (result != null) {
      final roomCodes = result[0]["roomCode"];
      final moveTimes = result[0]["moveTime"];
      final placesCounts = result[0]["placesCount"];
      final playersCount = result[0]["playersCount"];
      final List<RoomListItemModel> availableRooms = [];
      for (var i = 0; i < roomCodes.length; i++) {
        availableRooms.add(RoomListItemModel(
          roomInfo: RoomInfoModel(
            moveTime: moveTimes[i],
            placesCount: placesCounts[i],
            roomCode: roomCodes[i],
          ),
          playersCount: playersCount[i],
        ));
      }
      return availableRooms;
    }
    throw AppException('No results');
  }

  Future<List<RoomListItemModel>> getActiveRooms() async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'get_active_rooms',
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    getIt.get<AppLogger>().logger.log(Level.info, result);
    if (result != null) {
      final roomCodes = result[0]["roomCode"];
      final moveTimes = result[0]["moveTime"];
      final placesCounts = result[0]["placesCount"];
      final playersCount = result[0]["playersCount"];
      final isGameStarteds = result[0]["isGameStarted"];
      final List<RoomListItemModel> activeRooms = [];
      for (var i = 0; i < (roomCodes as List<dynamic>).length; i++) {
        activeRooms.add(RoomListItemModel(
          roomInfo: RoomInfoModel(
            moveTime: moveTimes[i],
            placesCount: placesCounts[i],
            roomCode: roomCodes[i],
          ),
          playersCount: playersCount[i],
          isGameStarted: isGameStarteds[i] == 1,
        ));
      }
      return activeRooms;
    }
    throw AppException('No results');
  }

  // возвращает playerId
  Future<RoomModel> createRoom({
    required RoomInfoModel roomInfo,
    required String nickname,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'create_room',
      queryParameters: {
        'p2': roomInfo.roomCode.toString(),
        'p3': roomInfo.moveTime.toString(),
        'p4': roomInfo.placesCount.toString(),
      },
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as dynamic;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final players = [
        PlayerModel(
          playerId: Id.fromInt(result[0]["playerId"][0]),
          nickname: nickname,
          isPlayer: true,
        )
      ];
      return RoomModel(
        roomInfo: roomInfo,
        players: players,
      );
    }
    throw AppException('No results');
  }

  Future<void> leaveRoom({required int roomCode}) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'leave_room',
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
      return;
    }
    throw AppException('No results');
  }

  Future<RoomModel> joinRoom({
    required RoomInfoModel roomInfo,
    required String nickname,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'join_room',
      queryParameters: {'p2': roomInfo.roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final playerId = Id.fromInt(result[0]["playerId"][0]);

      final nicknames = result[1]["nickname"];
      final playerIds = result[1]["playerId"];
      final List<PlayerModel> players = [
        PlayerModel(
          playerId: playerId,
          nickname: nickname,
          isPlayer: true,
        )
      ];

      for (var i = 0; i < (nicknames as List<dynamic>).length; i++) {
        players.add(
          PlayerModel(
            nickname: nicknames[i],
            playerId: Id.fromInt(playerIds[i]),
          ),
        );
      }
      return RoomModel(
        roomInfo: roomInfo,
        players: players,
      );
    }
    throw AppException('No results');
  }

  Future<RoomModel> updateRoom({
    required RoomInfoModel roomInfo,
    required PlayerModel player,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'update_room',
      queryParameters: {
        'p2': roomInfo.roomCode.toString(),
      },
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);

      Id? masterId =
          ((result[2]["masterId"] as List<dynamic>).isEmpty == true) ? null : Id.fromInt(result[2]["masterId"][0]);

      final playerIds = result[0]["playerId"];
      final nicknames = result[0]["nickname"];
      final List<PlayerModel> players = [player.copyWith(isMaster: player.playerId == masterId)];
      for (var i = 0; i < (nicknames as List<dynamic>).length; i++) {
        final nickname = nicknames[i];
        final playerId = Id.fromInt(playerIds[i]);
        final isMaster = masterId == playerId;
        players.add(
          PlayerModel(
            nickname: nickname,
            playerId: playerId,
            isMaster: isMaster,
          ),
        );
      }

      var isGameStarted = result[1]["isGameStarted"][0] == 1;

      return RoomModel(
        roomInfo: roomInfo,
        players: players,
        isGameStarted: isGameStarted,
      );
    }
    throw AppException('No results');
  }
}
