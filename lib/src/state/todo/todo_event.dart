part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.load({StatusEnum? filterStatus}) = _LoadTodo;
  const factory TodoEvent.add(
      {required String title,
      required String description,
      required String status,
      required DateTime dueDate}) = _AddTodo;
  const factory TodoEvent.toggle(
      {required TaskData task, required StatusEnum status}) = _ToggleTodo;
  const factory TodoEvent.update(
      {required int id,
      required String title,
      required String description,
      required String status,
      required DateTime dueDate}) = _UpdateTodo;
  const factory TodoEvent.delete({required int id}) = _DeleteTodo;
  const factory TodoEvent.search({
    required String title,
  }) = _SearchTodo;
}
