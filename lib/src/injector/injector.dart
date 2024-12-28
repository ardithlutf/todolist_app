import 'package:todolist_app/src/injector/database_module.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_app/src/injector/repository_module.dart';
import 'package:todolist_app/src/injector/service_module.dart';

import 'bloc_module.dart';
import 'rest_client_module.dart';

class Injector {
  static GetIt instance = GetIt.instance;
  Injector._();

  static void init() {
    ServiceModule.init();
    RestClientModule.init();

    if (!kIsWeb) {
      DatabaseModule.init();
      // DatabaseModule.initRepositories();
    }

    RepositoryModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
