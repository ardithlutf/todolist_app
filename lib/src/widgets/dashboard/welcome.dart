import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/app.dart';
import 'package:todolist_app/src/common/app_spacing.dart';
import 'package:todolist_app/src/common/app_themes.dart';
import 'package:todolist_app/src/router/app_router.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/auth/auth_bloc.dart';

class Welcome extends StatelessWidget {
  final ApplicationBloc bloc;
  final AuthBloc authBloc;

  const Welcome({super.key, required this.bloc, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        bloc: bloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FluttermojiCircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 24,
                    ),
                    AppSpacing.horizontalSpacing10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Ardith.',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: state.isDarkMode
                                  ? AppThemes
                                      .darkTheme.textTheme.titleSmall!.color
                                  : Colors.black54),
                        ),
                        AppSpacing.verticalSpacing4,
                        Text(
                          'Your daily task starts now',
                          style: TextStyle(
                            fontSize: 14,
                            color: state.isDarkMode
                                ? AppThemes
                                    .darkTheme.textTheme.titleSmall!.color
                                : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          state.isDarkMode ? Colors.black54 : Colors.white,
                      child: IconButton(
                        color:
                            !state.isDarkMode ? Colors.black54 : Colors.white,
                        onPressed: () {
                          final bool isDark = !state.isDarkMode;

                          bloc.add(ApplicationDarkModeChanged(enable: isDark));
                        },
                        tooltip: state.isDarkMode
                            ? 'Change to Light mode'
                            : 'Change to Dark mode',
                        icon: Icon(state.isDarkMode
                            ? Icons.wb_sunny_outlined
                            : Icons.bubble_chart),
                      ),
                    ),
                    BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state.status == UIStatusAuth.logout) {
                            GoRouter.of(context).clearStackAndNavigate(AppRouter.login);
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              state.isDarkMode ? Colors.black54 : Colors.white,
                          child: IconButton(
                            color: !state.isDarkMode
                                ? Colors.black54
                                : Colors.white,
                            onPressed: () {
                              authBloc.add(const AuthEvent.logout());
                            },
                            tooltip: 'Logout',
                            icon: const Icon(Icons.logout),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          );
        });
  }
}
