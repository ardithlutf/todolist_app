import 'dart:async';

import 'package:todolist_app/src/common/enums.dart';

abstract class LocalStorageService {
  String tokenKey = '';
  String isDarkModeKey = '';
  String isFirstUseKey = '';
  String isLoggedInKey = '';
  String statusKey = '';

  FutureOr<void> init();
  String? get token;
  bool get isDarkMode;

  bool get isFirstUse;
  bool get isLoggedIn;
  String get status;

  Future<bool> setToken(String token);
  Future<bool> setIsDarkMode(bool isDarkMode);
  Future<bool> setIsFirstUse(bool isFirstUse);
  Future<bool> setIsLoggedIn(bool isLoggedIn);
  Future<bool> setStatus(StatusEnum? statusKey);

  void setValue({required String key, required dynamic value});
  dynamic getValue({required String key});
}
