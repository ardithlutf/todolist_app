import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required LocalStorageService localStorageService,
  }) : super(const ApplicationState()) {
    _localStorageService = localStorageService;
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationDarkModeChanged>(_onDarkModeChanged);
  }

  late LocalStorageService _localStorageService;

  FutureOr<void> _onLoaded(
    ApplicationLoaded event,
    Emitter<ApplicationState> emit,
  ) {
    emit(state.copyWith(
      status: UIStatus.loading,
    ));

    final bool isDarkMode = _localStorageService.isDarkMode;

    emit(state.copyWith(
      status: UIStatus.loadSuccess,
      isDarkMode: isDarkMode,
    ));
  }

  FutureOr<void> _onDarkModeChanged(
    ApplicationDarkModeChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.isDarkMode != event.enable) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));

      _localStorageService.setIsDarkMode(event.enable);

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        isDarkMode: event.enable,
      ));
    }
  }
}
