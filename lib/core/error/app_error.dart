import 'package:dio/dio.dart';

class AppError {
  final String message;

  AppError([this.message = 'Unexpected error occured!']);

  @override
  String toString() => message;
}

String dioErrorMessage(DioException e) {
  final data = e.response?.data;

  final backendMessage = data?["message"] ?? data?["error"] ?? data?["errors"];

  if (backendMessage != null && backendMessage.toString().isNotEmpty) {
    return backendMessage.toString();
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return "Connection timed out. Try again.";

    case DioExceptionType.badCertificate:
      return "Invalid certificate from server.";

    case DioExceptionType.connectionError:
      return "You are offline. Check your internet connection.";

    case DioExceptionType.badResponse:
      return "Server returned an invalid response.";

    case DioExceptionType.cancel:
      return "Request was cancelled.";

    default:
      return "Unexpected error occurred.";
  }
}
