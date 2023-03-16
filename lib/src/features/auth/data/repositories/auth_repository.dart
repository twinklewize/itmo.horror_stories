import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart';
import 'package:horror_stories/src/core/services/data/hive/hive_client.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/exceptions/app_exception.dart';

const _kSessionKey = 'session';

@singleton
class AuthRepository {
  final DioBackendClient backendClient;
  final HiveMemoryClient memoryClient;
  SessionModel? _cachedSession;

  AuthRepository(this.backendClient, this.memoryClient);

  Future<SessionModel> signIn({
    required String login,
    required String password,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'sign_in',
      queryParameters: {'p1': login, 'p2': password},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (result != null) {
      final session = SessionModel(
        token: result[0]['token'][0].toString(),
        refreshToken: result[0]['refreshToken'][0].toString(),
        nickname: result[0]['nickname'][0],
      );
      getIt.get<AppLogger>().logger.log(Level.info, session);
      await _saveSession(session);
      return session;
    } else if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
    }
    throw AppException(error ?? 'No results');
  }

  Future<SessionModel> signUp({
    required String login,
    required String password,
    required String nickname,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'sign_up',
      queryParameters: {
        'p1': login,
        'p2': password,
        'p3': nickname,
      },
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      final session = SessionModel(
        token: result[0]['token'][0].toString(),
        refreshToken: result[0]['refreshToken'][0].toString(),
        nickname: result[0]['nickname'][0],
      );
      getIt.get<AppLogger>().logger.log(Level.info, session);
      await _saveSession(session);
      return session;
    }
    throw AppException('No results');
  }

  Future<void> deleteSession() async {
    await memoryClient.delete(_kSessionKey);
  }

  Future<SessionModel> updateSession() async {
    final oldSession = getCachedSession();
    if (oldSession != null) {
      final response = await backendClient.get(
        path: 'update_session',
        queryParameters: {'p1': oldSession.refreshToken},
        withToken: false,
      ) as Map<String, dynamic>;

      final error = response["ERROR"] as String?;
      final result = response["RESULTS"] as List<dynamic>?;
      if (error != null) {
        getIt.get<AppLogger>().logger.log(Level.error, error);
        throw AppException(error);
      }
      if (result != null) {
        getIt.get<AppLogger>().logger.log(Level.info, result);
        final session = SessionModel(
          token: result[0]['token'][0].toString(),
          refreshToken: result[0]['refreshToken'][0].toString(),
          nickname: result[0]['nickname'][0],
        );
        await _saveSession(session);
        return session;
      }
    }

    throw AppException('No results');
  }

  Future<SessionModel?> restore() async {
    final session = await memoryClient.get<SessionModel>(_kSessionKey);
    return session;
  }

  SessionModel? getCachedSession() {
    return _cachedSession;
  }

  Future<void> _saveSession(SessionModel session) async {
    _cachedSession = session;
    await memoryClient.put(_kSessionKey, session);
  }
}
