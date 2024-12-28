part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(UIStatusAuth.loading) UIStatusAuth status,
    @Default('Something went wrong') String error,
  }) = _Initial;
}

enum UIStatusAuth {
  started,
  loading,
  loginSuccess,
  logout,
  error,
}
