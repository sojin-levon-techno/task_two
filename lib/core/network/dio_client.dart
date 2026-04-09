import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:task_two/core/constants/app_constants.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      maxStale: const Duration(minutes: 15),
      priority: CachePriority.normal,
      hitCacheOnErrorCodes: [500],
      hitCacheOnNetworkFailure: true,
    );

    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }
  }
}
