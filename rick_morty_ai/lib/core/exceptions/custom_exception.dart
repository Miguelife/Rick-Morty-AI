import 'app_exceptions.dart';

abstract interface class CustomException implements Exception {
  final String title;
  final String message;

  const CustomException({required this.title, required this.message});

  static CustomException handle(Object exception) {
    if (exception is AppException) {
      return exception;
    }

    return const DefaultException();
  }
}
