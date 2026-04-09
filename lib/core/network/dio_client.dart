import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_two/core/constants/app_constants.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseURL,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      ),
    );

    if (!kReleaseMode) {}
  }
}
