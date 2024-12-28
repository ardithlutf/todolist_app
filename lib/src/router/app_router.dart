import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/database/appdatabase.dart';
import 'package:todolist_app/src/injector/injector.dart';
import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';
import 'package:todolist_app/src/ui/add_page.dart';
import 'package:todolist_app/src/ui/dashboard.dart';
import 'package:todolist_app/src/ui/login.dart';

class AppRouter {
  AppRouter._();

  static const String login = '/';
  static const String home = '/home';
  static const String addTodo = '/addTodo';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        redirect: (BuildContext context, GoRouterState state) {
          final bool isAlreadyLoggedIn =
              Injector.instance<LocalStorageService>().isLoggedIn;
          if (isAlreadyLoggedIn) {
            return AppRouter.home;
          } else {
            return AppRouter.login;
          }
        },
        path: login,
        name: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: home,
        name: home,
        builder: (context, state) => const DashboardPage(title: 'Todo'),
      ),
      GoRoute(
        path: addTodo,
        name: addTodo,
        builder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;

          final isUpdate = args["isUpdate"] as bool;
          final data = args["data"] as TaskData?;

          return AddTodoScreen(isUpdate: isUpdate, data: data);
        },
      ),
    ],
  );
}

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
