import 'dart:async';
import 'package:drift/drift.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide JsonKey;
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/database/appdatabase.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DatabaseManager database;
  TodoBloc(this.database) : super(const TodoState()) {
    on<_LoadTodo>(_onLoadTodo);
    on<_AddTodo>(_onAddTodo);
    on<_ToggleTodo>(_onToggleTodo);
    on<_UpdateTodo>(_onUpdateTodo);
    on<_DeleteTodo>(_onDeleteTodo);
    on<_SearchTodo>(_onSearchTodo);
  }

  Future<void> _onLoadTodo(_LoadTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      List<TaskData> tasks = await database.getAllTask();
      if (event.filterStatus != null) {
        List<TaskData> tasksFiltered =
            tasks.where((e) => e.status == event.filterStatus!.name).toList();
        emit(state.copyWith(
            status: UIStatusTodo.loadedFiltered,
            tasks: tasks,
            tasksFiltered: tasksFiltered));
        return;
      }
      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onAddTodo(_AddTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      await database.insertTask(
        TaskCompanion.insert(
          title: event.title,
          description: Value(event.description),
          dueDate: DateTime.now(),
          status: StatusEnum.pending.name,
        ),
      );
      final tasks = await database.getAllTask();

      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
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

      await database.updateTask(data);

      final tasks = await database.getAllTask();

      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
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

      await database.updateTask(data);

      final tasks = await database.getAllTask();

      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onDeleteTodo(_DeleteTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      await database.deleteTask(event.id);

      final tasks = await database.getAllTask();

      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }

  Future<void> _onSearchTodo(_SearchTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: UIStatusTodo.loading));
    try {
      final tasks = await database.searchTask(event.title);
      emit(state.copyWith(status: UIStatusTodo.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: UIStatusTodo.error, error: e.toString()));
    }
  }
}
