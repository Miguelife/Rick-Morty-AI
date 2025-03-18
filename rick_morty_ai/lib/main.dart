import 'package:flutter/material.dart';
import 'package:rick_morty_ai/core/dependency_injection/locator.dart';
import 'presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const App());
}
