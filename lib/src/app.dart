import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/common/app_themes.dart';
import 'package:todolist_app/src/injector/injector.dart';
import 'package:todolist_app/src/router/app_router.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/auth/auth_bloc.dart';
import 'package:todolist_app/src/state/todo/todo_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ApplicationBloc _bloc;
  late final AuthBloc _authBloc;
  late final TodoBloc _todoBloc;
  late bool _isDarkMode;

  @override
  void initState() {
    _bloc = Injector.instance<ApplicationBloc>();
    _authBloc = Injector.instance<AuthBloc>();
    _todoBloc = Injector.instance<TodoBloc>();
    _bloc.add(const ApplicationLoaded());
    _isDarkMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>.value(value: _bloc),
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<TodoBloc>.value(value: _todoBloc)
      ],
      child: MaterialApp.router(
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        title: 'BoilerPlate',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
