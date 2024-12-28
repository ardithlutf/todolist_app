import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/todo/todo_bloc.dart';
import 'package:todolist_app/src/state/auth/auth_bloc.dart';

import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<ApplicationBloc>(
        ApplicationBloc(localStorageService: injector()));

    injector.registerFactory<AuthBloc>(
      () => AuthBloc(
          reqResRepository: injector(),
          localStorageService: injector()),
    );

    injector.registerFactory<TodoBloc>(
      () => TodoBloc(injector()),
    );
  }
}
