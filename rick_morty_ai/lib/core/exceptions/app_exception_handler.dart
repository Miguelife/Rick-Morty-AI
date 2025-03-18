import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_morty_ai/core/exceptions/app_exceptions.dart';

class AppExceptionHandler {
  AppException handle(Object exception) {
    if (exception is! Exception) return const DefaultException();

    if (exception is SocketException) {
      return const NoInternetException();
    } else if (exception is DioException) {
      if (exception.type is SocketException) {
        return const NoInternetException();
      }

      return _manageDioException(data: exception.response?.data);
    }

    return const DefaultException();
  }

  AppException _manageDioException({required dynamic data}) {
    if (data is List<dynamic> &&
        data.isNotEmpty &&
        data[0].containsKey("message")) {
      return DetailedServerException(message: data[0]["message"]);
    }

    return const DefaultException();
  }
}
