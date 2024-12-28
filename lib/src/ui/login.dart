import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/common/app_spacing.dart';
import 'package:todolist_app/src/common/app_themes.dart';
import 'package:todolist_app/src/router/app_router.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final ApplicationBloc _appBloc;
  late final AuthBloc _authBloc;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _appBloc = BlocProvider.of<ApplicationBloc>(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(const AuthEvent.started());
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _appBloc,
        child: BlocConsumer<ApplicationBloc, ApplicationState>(
          listener: (context, stateApp) {
            // TODO: implement listener
          },
          builder: (context, stateApp) {
            return BlocListener<AuthBloc, AuthState>(
              bloc: _authBloc,
              listener: (context, state) {
                if (state.status == UIStatusAuth.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text(state.error),
                      duration: const Duration(seconds: 3),
                    ));
                }
                if (state.status == UIStatusAuth.loginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Login success'),
                    duration: Duration(seconds: 2),
                  ));

                  context.pushNamed(AppRouter.home);
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AppSpacing.verticalSpacing48,
                          AppSpacing.verticalSpacing48,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Login 👋',
                                  style: stateApp.isDarkMode
                                      ? AppThemes.darkTheme.textTheme.titleLarge
                                      : AppThemes
                                          .lightTheme.textTheme.titleLarge,
                                  textAlign: TextAlign.start),
                              AppSpacing.verticalSpacing16,
                              Text('Login with your email and password. ',
                                  style: stateApp.isDarkMode
                                      ? AppThemes.darkTheme.textTheme.labelLarge
                                      : AppThemes
                                          .lightTheme.textTheme.labelLarge,
                                  textAlign: TextAlign.start),
                            ],
                          ),
                          AppSpacing.verticalSpacing48,
                          AppSpacing.verticalSpacing48,
                          Container(
                            decoration: BoxDecoration(
                              color: stateApp.isDarkMode
                                  ? Colors.black
                                  : const Color(0xFFFFFFFF),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: kElevationToShadow[4],
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              style: TextStyle(
                                color: stateApp.isDarkMode
                                    ? AppThemes
                                        .darkTheme.textTheme.labelSmall!.color
                                    : AppThemes
                                        .lightTheme.textTheme.labelSmall!.color,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: stateApp.isDarkMode
                                    ? AppThemes.darkTheme.textTheme.labelSmall!
                                    : AppThemes
                                        .lightTheme.textTheme.labelSmall!,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                          AppSpacing.verticalSpacing16,
                          Container(
                            decoration: BoxDecoration(
                              color: stateApp.isDarkMode
                                  ? Colors.black
                                  : const Color(0xFFFFFFFF),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: kElevationToShadow[4],
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(
                                color: stateApp.isDarkMode
                                    ? AppThemes
                                        .darkTheme.textTheme.labelSmall!.color
                                    : AppThemes
                                        .lightTheme.textTheme.labelSmall!.color,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: stateApp.isDarkMode
                                    ? AppThemes.darkTheme.textTheme.labelSmall!
                                    : AppThemes
                                        .lightTheme.textTheme.labelSmall!,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          AppSpacing.verticalSpacing32,
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(
                                    Color.fromRGBO(242, 110, 86, 1)),
                                shadowColor:
                                    const WidgetStatePropertyAll(Colors.black),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _authBloc.add(AuthEvent.login(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                                  setState(() {});
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Login',
                                      style: TextStyle(color: Colors.white)),
                                  AppSpacing.horizontalSpacing10,
                                  state.status == UIStatusAuth.loading
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                            color: Colors.orangeAccent,
                                          ))
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
