import 'package:rick_morty_ai/core/exceptions/custom_exception.dart';

sealed class AppException implements CustomException {
  const AppException();
}

class AuthorizationException implements AppException {
  @override
  String get title => "Error";

  @override
  String get message => "Authorization error";

  const AuthorizationException();
}

class DefaultException implements AppException {
  @override
  String get title => "Error";

  @override
  String get message => "Something went wrong";

  const DefaultException();
}

class NoInternetException implements AppException {
  @override
  String get title => "Error";

  @override
  String get message => "No internet connection";

  const NoInternetException();
}

class DetailedServerException implements AppException {
  @override
  String get title => "Error";

  @override
  final String message;

  const DetailedServerException({required this.message});
}
