// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEventCopyWith<$Res> {
  factory $TodoEventCopyWith(TodoEvent value, $Res Function(TodoEvent) then) =
      _$TodoEventCopyWithImpl<$Res, TodoEvent>;
}

/// @nodoc
class _$TodoEventCopyWithImpl<$Res, $Val extends TodoEvent>
    implements $TodoEventCopyWith<$Res> {
  _$TodoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTodoImplCopyWith<$Res> {
  factory _$$LoadTodoImplCopyWith(
          _$LoadTodoImpl value, $Res Function(_$LoadTodoImpl) then) =
      __$$LoadTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusEnum? filterStatus});
}

/// @nodoc
class __$$LoadTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$LoadTodoImpl>
    implements _$$LoadTodoImplCopyWith<$Res> {
  __$$LoadTodoImplCopyWithImpl(
      _$LoadTodoImpl _value, $Res Function(_$LoadTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterStatus = freezed,
  }) {
    return _then(_$LoadTodoImpl(
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as StatusEnum?,
    ));
  }
}

/// @nodoc

class _$LoadTodoImpl implements _LoadTodo {
  const _$LoadTodoImpl({this.filterStatus});

  @override
  final StatusEnum? filterStatus;

  @override
  String toString() {
    return 'TodoEvent.load(filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTodoImpl &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterStatus);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTodoImplCopyWith<_$LoadTodoImpl> get copyWith =>
      __$$LoadTodoImplCopyWithImpl<_$LoadTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return load(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return load?.call(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(filterStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _LoadTodo implements TodoEvent {
  const factory _LoadTodo({final StatusEnum? filterStatus}) = _$LoadTodoImpl;

  StatusEnum? get filterStatus;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$LoadTodoImplCopyWith<_$LoadTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTodoImplCopyWith<$Res> {
  factory _$$AddTodoImplCopyWith(
          _$AddTodoImpl value, $Res Function(_$AddTodoImpl) then) =
      __$$AddTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title, String description, String status, DateTime dueDate});
}

/// @nodoc
class __$$AddTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$AddTodoImpl>
    implements _$$AddTodoImplCopyWith<$Res> {
  __$$AddTodoImplCopyWithImpl(
      _$AddTodoImpl _value, $Res Function(_$AddTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? dueDate = null,
  }) {
    return _then(_$AddTodoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddTodoImpl implements _AddTodo {
  const _$AddTodoImpl(
      {required this.title,
      required this.description,
      required this.status,
      required this.dueDate});

  @override
  final String title;
  @override
  final String description;
  @override
  final String status;
  @override
  final DateTime dueDate;

  @override
  String toString() {
    return 'TodoEvent.add(title: $title, description: $description, status: $status, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, status, dueDate);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoImplCopyWith<_$AddTodoImpl> get copyWith =>
      __$$AddTodoImplCopyWithImpl<_$AddTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return add(title, description, status, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return add?.call(title, description, status, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(title, description, status, dueDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _AddTodo implements TodoEvent {
  const factory _AddTodo(
      {required final String title,
      required final String description,
      required final String status,
      required final DateTime dueDate}) = _$AddTodoImpl;

  String get title;
  String get description;
  String get status;
  DateTime get dueDate;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$AddTodoImplCopyWith<_$AddTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTodoImplCopyWith<$Res> {
  factory _$$ToggleTodoImplCopyWith(
          _$ToggleTodoImpl value, $Res Function(_$ToggleTodoImpl) then) =
      __$$ToggleTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskData task, StatusEnum status});
}

/// @nodoc
class __$$ToggleTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$ToggleTodoImpl>
    implements _$$ToggleTodoImplCopyWith<$Res> {
  __$$ToggleTodoImplCopyWithImpl(
      _$ToggleTodoImpl _value, $Res Function(_$ToggleTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? status = null,
  }) {
    return _then(_$ToggleTodoImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskData,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
    ));
  }
}

/// @nodoc

class _$ToggleTodoImpl implements _ToggleTodo {
  const _$ToggleTodoImpl({required this.task, required this.status});

  @override
  final TaskData task;
  @override
  final StatusEnum status;

  @override
  String toString() {
    return 'TodoEvent.toggle(task: $task, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTodoImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, status);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTodoImplCopyWith<_$ToggleTodoImpl> get copyWith =>
      __$$ToggleTodoImplCopyWithImpl<_$ToggleTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return toggle(task, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return toggle?.call(task, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(task, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return toggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return toggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (toggle != null) {
      return toggle(this);
    }
    return orElse();
  }
}

abstract class _ToggleTodo implements TodoEvent {
  const factory _ToggleTodo(
      {required final TaskData task,
      required final StatusEnum status}) = _$ToggleTodoImpl;

  TaskData get task;
  StatusEnum get status;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$ToggleTodoImplCopyWith<_$ToggleTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoImplCopyWith<$Res> {
  factory _$$UpdateTodoImplCopyWith(
          _$UpdateTodoImpl value, $Res Function(_$UpdateTodoImpl) then) =
      __$$UpdateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String status,
      DateTime dueDate});
}

/// @nodoc
class __$$UpdateTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$UpdateTodoImpl>
    implements _$$UpdateTodoImplCopyWith<$Res> {
  __$$UpdateTodoImplCopyWithImpl(
      _$UpdateTodoImpl _value, $Res Function(_$UpdateTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? dueDate = null,
  }) {
    return _then(_$UpdateTodoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpdateTodoImpl implements _UpdateTodo {
  const _$UpdateTodoImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.dueDate});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String status;
  @override
  final DateTime dueDate;

  @override
  String toString() {
    return 'TodoEvent.update(id: $id, title: $title, description: $description, status: $status, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, status, dueDate);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      __$$UpdateTodoImplCopyWithImpl<_$UpdateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return update(id, title, description, status, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return update?.call(id, title, description, status, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, title, description, status, dueDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodo implements TodoEvent {
  const factory _UpdateTodo(
      {required final int id,
      required final String title,
      required final String description,
      required final String status,
      required final DateTime dueDate}) = _$UpdateTodoImpl;

  int get id;
  String get title;
  String get description;
  String get status;
  DateTime get dueDate;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTodoImplCopyWith<$Res> {
  factory _$$DeleteTodoImplCopyWith(
          _$DeleteTodoImpl value, $Res Function(_$DeleteTodoImpl) then) =
      __$$DeleteTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$DeleteTodoImpl>
    implements _$$DeleteTodoImplCopyWith<$Res> {
  __$$DeleteTodoImplCopyWithImpl(
      _$DeleteTodoImpl _value, $Res Function(_$DeleteTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteTodoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteTodoImpl implements _DeleteTodo {
  const _$DeleteTodoImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'TodoEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      __$$DeleteTodoImplCopyWithImpl<_$DeleteTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeleteTodo implements TodoEvent {
  const factory _DeleteTodo({required final int id}) = _$DeleteTodoImpl;

  int get id;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTodoImplCopyWith<$Res> {
  factory _$$SearchTodoImplCopyWith(
          _$SearchTodoImpl value, $Res Function(_$SearchTodoImpl) then) =
      __$$SearchTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$SearchTodoImplCopyWithImpl<$Res>
    extends _$TodoEventCopyWithImpl<$Res, _$SearchTodoImpl>
    implements _$$SearchTodoImplCopyWith<$Res> {
  __$$SearchTodoImplCopyWithImpl(
      _$SearchTodoImpl _value, $Res Function(_$SearchTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$SearchTodoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchTodoImpl implements _SearchTodo {
  const _$SearchTodoImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'TodoEvent.search(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTodoImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTodoImplCopyWith<_$SearchTodoImpl> get copyWith =>
      __$$SearchTodoImplCopyWithImpl<_$SearchTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatusEnum? filterStatus) load,
    required TResult Function(
            String title, String description, String status, DateTime dueDate)
        add,
    required TResult Function(TaskData task, StatusEnum status) toggle,
    required TResult Function(int id, String title, String description,
            String status, DateTime dueDate)
        update,
    required TResult Function(int id) delete,
    required TResult Function(String title) search,
  }) {
    return search(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatusEnum? filterStatus)? load,
    TResult? Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult? Function(TaskData task, StatusEnum status)? toggle,
    TResult? Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult? Function(int id)? delete,
    TResult? Function(String title)? search,
  }) {
    return search?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatusEnum? filterStatus)? load,
    TResult Function(
            String title, String description, String status, DateTime dueDate)?
        add,
    TResult Function(TaskData task, StatusEnum status)? toggle,
    TResult Function(int id, String title, String description, String status,
            DateTime dueDate)?
        update,
    TResult Function(int id)? delete,
    TResult Function(String title)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTodo value) load,
    required TResult Function(_AddTodo value) add,
    required TResult Function(_ToggleTodo value) toggle,
    required TResult Function(_UpdateTodo value) update,
    required TResult Function(_DeleteTodo value) delete,
    required TResult Function(_SearchTodo value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTodo value)? load,
    TResult? Function(_AddTodo value)? add,
    TResult? Function(_ToggleTodo value)? toggle,
    TResult? Function(_UpdateTodo value)? update,
    TResult? Function(_DeleteTodo value)? delete,
    TResult? Function(_SearchTodo value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTodo value)? load,
    TResult Function(_AddTodo value)? add,
    TResult Function(_ToggleTodo value)? toggle,
    TResult Function(_UpdateTodo value)? update,
    TResult Function(_DeleteTodo value)? delete,
    TResult Function(_SearchTodo value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _SearchTodo implements TodoEvent {
  const factory _SearchTodo({required final String title}) = _$SearchTodoImpl;

  String get title;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  
  _$$SearchTodoImplCopyWith<_$SearchTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TodoState {
  UIStatusTodo get status => throw _privateConstructorUsedError;
  List<TaskData> get tasks => throw _privateConstructorUsedError;
  List<TaskData> get tasksFiltered => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call(
      {UIStatusTodo status,
      List<TaskData> tasks,
      List<TaskData> tasksFiltered,
      String error});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? tasksFiltered = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatusTodo,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
      tasksFiltered: null == tasksFiltered
          ? _value.tasksFiltered
          : tasksFiltered // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIStatusTodo status,
      List<TaskData> tasks,
      List<TaskData> tasksFiltered,
      String error});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? tasksFiltered = null,
    Object? error = null,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatusTodo,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
      tasksFiltered: null == tasksFiltered
          ? _value._tasksFiltered
          : tasksFiltered // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = UIStatusTodo.loading,
      final List<TaskData> tasks = const [],
      final List<TaskData> tasksFiltered = const [],
      this.error = 'Something went wrong'})
      : _tasks = tasks,
        _tasksFiltered = tasksFiltered;

  @override
  
  final UIStatusTodo status;
  final List<TaskData> _tasks;
  @override
  
  List<TaskData> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<TaskData> _tasksFiltered;
  @override
  
  List<TaskData> get tasksFiltered {
    if (_tasksFiltered is EqualUnmodifiableListView) return _tasksFiltered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasksFiltered);
  }

  @override
  
  final String error;

  @override
  String toString() {
    return 'TodoState(status: $status, tasks: $tasks, tasksFiltered: $tasksFiltered, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._tasksFiltered, _tasksFiltered) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_tasksFiltered),
      error);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TodoState {
  const factory _Initial(
      {final UIStatusTodo status,
      final List<TaskData> tasks,
      final List<TaskData> tasksFiltered,
      final String error}) = _$InitialImpl;

  @override
  UIStatusTodo get status;
  @override
  List<TaskData> get tasks;
  @override
  List<TaskData> get tasksFiltered;
  @override
  String get error;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
