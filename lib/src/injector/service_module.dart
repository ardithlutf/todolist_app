import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';
import 'package:todolist_app/src/services/local_storage_service/shared_preferences_service.dart';

import 'injector.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<LocalStorageService>(
      SharedPreferencesService(),
      signalsReady: true,
    );
  }
}
