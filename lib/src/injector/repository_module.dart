import 'package:todolist_app/src/data/repo/reqRes_repository_impl.dart';
import 'package:todolist_app/src/data/repo/repo.dart';

import 'injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<ReqResRepository>(
      () => ReqResRepositoryImpl(
        reqResApiClient: injector(),
      ),
    );
  }
}
