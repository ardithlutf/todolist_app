import 'package:todolist_app/src/database/appdatabase.dart';
import 'package:todolist_app/src/injector/injector.dart';

class DatabaseModule {
  DatabaseModule._();

  static void init() {
    final injector = Injector.instance;

    /* Floor package didn't support for Web platform
    If you run this api on web, you must remove Local database module, or using
    another local database package, or check kIsWeb everywhere you use the local
    database module
    */

    injector.registerSingletonAsync<DatabaseManager>(() async {
      final DatabaseManager databaseManager = DatabaseManager();
      return databaseManager;
    });
  }
}
