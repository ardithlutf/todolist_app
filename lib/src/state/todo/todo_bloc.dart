import 'dart:async';
import 'package:drift/drift.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide JsonKey;
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/database/appdatabase.dart';
import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required DatabaseManager databaseManager,
    required LocalStorageService localStorageService,
  }) : super(const TodoState()) {
    _databaseManager = databaseManager;
    _localStorageService = localStorageService;
    on<_LoadTodo>(_onLoadTodo);
    on<_AddTodo>(_onAddTodo);
    on<_ToggleTodo>(_onToggleTodo);
    on<_UpdateTodo>(_onUpdateTodo);
    on<_DeleteTodo>(_onDeleteTodo);
    on<_SearchTodo>(_onSearchTodo);
  }

  late DatabaseManager _databaseManager;
  late LocalStorageService _localStorageService;

  Future<void> _onLoadTodo(_LoadTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      await _lookupFilterTasks(event, emit);
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onAddTodo(_AddTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      await _databaseManager.insertTask(
        TaskCompanion.insert(
          title: event.title,
          description: Value(event.description),
          dueDate: DateTime.now(),
          status: StatusEnum.pending.name,
        ),
      );
      await _lookupFilterTasks(event, emit);
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onToggleTodo(_ToggleTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      final data = TaskData(
        id: event.task.id,
        title: event.task.title,
        description: event.task.description,
        dueDate: event.task.dueDate,
        status: StatusEnum.completed.name,
      );

      await _databaseManager.updateTask(data);

      await _lookupFilterTasks(event, emit);
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onUpdateTodo(_UpdateTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      final TaskData data = TaskData(
        id: event.id,
        title: event.title,
        dueDate: event.dueDate,
        status: event.status,
      );

      await _databaseManager.updateTask(data);

      await _lookupFilterTasks(event, emit);
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onDeleteTodo(_DeleteTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      await _databaseManager.deleteTask(event.id);

      await _lookupFilterTasks(event, emit);
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onSearchTodo(_SearchTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      final tasks = await _databaseManager.searchTask(event.title);
      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  _lookupFilterTasks(TodoEvent event, Emitter<TodoState> emit) async {
    List<TaskData> tasks = await _databaseManager.getAllTask();

    if (_localStorageService.status.isNotEmpty) {
      List<TaskData> tasksFiltered =
          tasks.where((e) => e.status == _localStorageService.status).toList();
      emit(state.copyWith(
          status: UIStatusTodo.loadedFiltered,
          tasks: tasks,
          tasksFiltered: tasksFiltered));
      return;
    }
    emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
  }
}
