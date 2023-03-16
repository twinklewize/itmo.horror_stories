import 'package:dio/dio.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/features/auth/data/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:horror_stories/src/config/api.dart';
import 'package:logger/logger.dart';

import '../../logger/logger.dart';

const _kDefaultQueryParams = {
  'db': 285627,
  'format': 'columns_compact',
};

@singleton
class DioBackendClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));

  Future<T?> _handleError<T>(DioError error) {
    if (error.response != null) {
      return Future.error(error.response!.data);
    } else {
      return Future.error(error.message ?? 'Неизвестная ошибка');
    }
  }

  Future<T?> get<T>({
    required String path,
    Map<String, String>? queryParameters,
    bool withToken = true,
  }) async {
    final token = await extractToken();
    getIt.get<AppLogger>().logger.log(Level.info, token);
    try {
      final queryParams = {
        'pname': path,
        ..._kDefaultQueryParams,
      };
      if (queryParameters != null) {
        queryParams.addAll(queryParameters);
      }
      if (token != null && withToken) {
        queryParams.addAll({'p1': token});
      }

      final response = await _dio.get<T>(ApiConfig.api, queryParameters: queryParams);
      return response.data;
    } on DioError catch (error) {
      return _handleError(error);
    }
  }

  Future<void> close() async {
    _dio.close();
  }
}

Future<String?> extractToken() async {
  return getIt<AuthRepository>().getCachedSession()?.token;
}
