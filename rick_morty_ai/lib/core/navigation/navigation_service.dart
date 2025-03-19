import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty_ai/core/exceptions/custom_exception.dart';
import 'package:rick_morty_ai/core/navigation/navigation_service_interface.dart';

@Singleton(as: NavigationServiceInterface)
class NavigationService implements NavigationServiceInterface {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<T?>? push<T extends Object?>(Widget page, {Object? arguments}) {
    return navigatorKey.currentState!.push<T>(
      MaterialPageRoute<T>(
        builder: (context) => page,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }

  @override
  void pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.pop<T>(result);
  }

  @override
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page,
      {Object? arguments, TO? result}) {
    return navigatorKey.currentState!.pushReplacement<T, TO>(
      MaterialPageRoute<T>(
        builder: (context) => page,
        settings: RouteSettings(arguments: arguments),
      ),
      result: result,
    );
  }

  @override
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page,
      {RoutePredicate? predicate, Object? arguments}) {
    return navigatorKey.currentState!.pushAndRemoveUntil<T>(
      MaterialPageRoute<T>(
        builder: (context) => page,
        settings: RouteSettings(arguments: arguments),
      ),
      predicate ?? (route) => false,
    );
  }

  @override
  void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  @override
  void popUntilFirst() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  @override
  void showExceptionDialog(Object exception) {
    CustomException customException = CustomException.from(exception);

    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(customException.title),
        content: Text(customException.message),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
