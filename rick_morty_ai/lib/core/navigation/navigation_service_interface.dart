import 'package:flutter/widgets.dart';

abstract interface class NavigationServiceInterface {
  Future<T?>? push<T extends Object?>(Widget page, {Object? arguments});
  void pop<T extends Object?>([T? result]);
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page,
      {Object? arguments, TO? result});
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page,
      {RoutePredicate? predicate, Object? arguments});
  void popUntil(RoutePredicate predicate);
  void popUntilFirst();
  bool canPop();
  void showExceptionDialog(Object exception);
}
