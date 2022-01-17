import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'exception_manager.dart';

@alwaysThrows
void handleError(DioError error) {
  if (error.error is SocketException)
    throw error.error;
  else if (error.type == DioErrorType.receiveTimeout ||
      error.type == DioErrorType.sendTimeout ||
      error.type == DioErrorType.connectTimeout) {
    throw TimeoutException(error.toString());
  } else if (error.response != null &&
      error.response?.statusCode != null &&
      exceptions.containsKey(error.response?.statusCode!)) {
    if (error.response?.data is Map) {
      throw exceptions[error.response!.statusCode]!(
          jsonEncode(error.response?.data));
    } else {
      throw exceptions[error.response!.statusCode]!(
          error.response?.data?.toString() ?? "");
    }
  } else {
    throw FetchingDataException();
  }
}
