import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/injector/injector.dart';
import 'package:todolist_app/src/services/local_storage_service/local_storage_service.dart';

class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService() {
    init();
  }
  late final SharedPreferences _pref;

  @override
  String tokenKey = 'tokenKey';
  @override
  String isDarkModeKey = 'isDarkModeKey';
  @override
  String isFirstUseKey = 'isFirstUseKey';
  @override
  String isLoggedInKey = 'isLoggedInKey';
  @override
  String statusKey = 'statusKey';

  @override
  FutureOr<void> init() async {
    _pref = await SharedPreferences.getInstance();
    Injector.instance.signalReady(this);
  }

  @override
  String? get token => _pref.getString(tokenKey);

  @override
  bool get isDarkMode => _pref.getBool(isDarkModeKey) ?? false;

  @override
  bool get isFirstUse => _pref.getBool(isFirstUseKey) ?? false;

  @override
  bool get isLoggedIn => _pref.getBool(isLoggedInKey) ?? false;

  @override
  String get status => _pref.getString(statusKey) ?? '';

  @override
  Future<bool> setIsDarkMode(bool isDarkMode) async {
    return await _pref.setBool(isDarkModeKey, isDarkMode);
  }

  @override
  Future<bool> setIsFirstUse(bool isFirstUse) async {
    return await _pref.setBool(isFirstUseKey, isFirstUse);
  }

  @override
  Future<bool> setIsLoggedIn(bool isLoggedIn) async {
    return await _pref.setBool(isLoggedInKey, isLoggedIn);
  }

  @override
  Future<bool> setToken(String token) async {
    return await _pref.setString(tokenKey, token);
  }

  @override
  Future<bool> setStatus(StatusEnum? status) async {
    return await _pref.setString(statusKey, status?.name ?? '');
  }

  @override
  getValue({required String key}) {
    return _pref.get(key);
  }

  @override
  void setValue({required String key, required value}) {}
}
