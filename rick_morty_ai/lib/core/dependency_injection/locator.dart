import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_ai/core/dependency_injection/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();
