import 'package:horror_stories/src/core/exceptions/app_exception.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/logger/logger.dart';
import 'package:horror_stories/src/features/main/data/payloads/add_hint_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/players_info_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/restore_game_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/start_game_payload.dart';
import 'package:horror_stories/src/features/main/data/payloads/update_game_payload.dart';
import 'package:injectable/injectable.dart';

import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart';
import 'package:logger/logger.dart';

@singleton
class GameRepository {
  final DioBackendClient backendClient;

  GameRepository(this.backendClient);

  Future<StartGamePayload> startGame(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'start_game',
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

  Future<JoinGamePayload> joinGame(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'join_game',
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

  Future<RestoreGamePayload> restoreGameState(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'restore_game_state',
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

  Future<UpdateGamePayload> updateGame(int roomCode) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'update_game_state',
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

  Future<void> vote(Id tableCardId) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'vote',
      queryParameters: {'p2': tableCardId.toString()},
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

  Future<AddHintPayload> addHint({
    required int roomCode,
    required String cardName,
    required HintStatus hintStatus,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'choose_hints',
      queryParameters: {
        'p2': roomCode.toString(),
        'p3': cardName,
        'p4': hintStatus.name,
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
    }
    throw AppException('No results');
  }
}
