import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist_app/src/data/remote/reqRes_api.dart';
import 'package:todolist_app/src/injector/injector.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;
    const String dioInstance = 'dioInstance';

    /// Dio
    injector.registerLazySingleton<Dio>(
      () {
        /// TODO: custom DIO here
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: 'https://reqres.in/api/',
          ),
        );
        if (!kReleaseMode) {
          dio.interceptors.add(
            LogInterceptor(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              request: false,
            ),
          );
        }
        return dio;
      },
      instanceName: dioInstance,
    );

    injector.registerFactory<ReqResApiClient>(
      () => ReqResApiClient(
        injector(instanceName: dioInstance),
      ),
    );
  }
}
