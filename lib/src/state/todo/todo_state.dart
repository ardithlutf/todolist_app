part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(UIStatusTodo.loading) UIStatusTodo status,
    @Default([]) List<TaskData> tasks,
    @Default([]) List<TaskData> tasksFiltered,
    @Default('Something went wrong') String error,
  }) = _Initial;
}

enum UIStatusTodo {
  loading,
  loaded,
  loadedFiltered,
  loadFailed,
  insertSuccess,
  updateSuccess,
  deleteSuccess,
  error,
}
