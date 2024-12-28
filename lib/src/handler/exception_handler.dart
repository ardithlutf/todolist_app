import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todolist_app/src/handler/custom_exception.dart';

/// Handle exception from dio
class ExceptionHandler {
  ExceptionHandler._();

  static handleException(Object obj) {
    if (obj is DioException) {
      throw _getException(obj);
    }
  }

  static CustomException _getException(DioException error) {
    if (error.type == DioExceptionType.connectionError) {
      if (error.error is SocketException) {
        return CustomException(message: error.message ?? 'unknown error'

            /// TODO: message
            );
      } else {
        return CustomException(message: error.message ?? 'unknown error');
      }
    } else if (error.type == DioExceptionType.badResponse) {
      try {
        if (error.response!.statusCode == 401) {
          return CustomException(message: error.response!.data['error']);
        } else {
          return CustomException(message: error.response!.data['error']);
        }
      } catch (e) {
        return CustomException(message: e.toString());
      }
    } else if (error.type == DioExceptionType.sendTimeout) {
      return CustomException(message: error.message ?? 'unknown error');
    } else {
      return CustomException(message: error.message ?? 'unknown error');
    }
  }
}
