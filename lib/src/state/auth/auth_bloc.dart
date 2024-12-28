import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist_app/src/data/repo/repo.dart';
import 'package:todolist_app/src/handler/custom_exception.dart';
import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required ReqResRepository reqResRepository,
    required LocalStorageService localStorageService,
  }) : super(const AuthState()) {
    _repository = reqResRepository;
    _localStorageService = localStorageService;
    on<_Started>(_onStart);
    on<_AuthLogin>(_onLogin);
    on<_AuthLogout>(_onLogout);
  }

  late ReqResRepository _repository;
  late LocalStorageService _localStorageService;

  FutureOr<void> _onStart(_Started event, Emitter<AuthState> emit) {
    emit(state.copyWith(status: UIStatusAuth.started));
  }

  FutureOr<void> _onLogin(_AuthLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: UIStatusAuth.loading));
    try {
      final response =
          await _repository.login(email: event.email, password: event.password);

      _localStorageService.setToken(response.token);
      _localStorageService.setIsLoggedIn(true);
      emit(state.copyWith(status: UIStatusAuth.loginSuccess));
    } catch (e) {
      if (e is CustomException) {
        emit(state.copyWith(status: UIStatusAuth.error, error: e.message));
      }
    }
  }

  FutureOr<void> _onLogout(_AuthLogout event, Emitter<AuthState> emit) {
    emit(state.copyWith(status: UIStatusAuth.loading));
    try {
      _localStorageService.setIsLoggedIn(false);
      emit(state.copyWith(status: UIStatusAuth.logout));
    } catch (e) {
      emit(state.copyWith(status: UIStatusAuth.error, error: e.toString()));
    }
  }
}
