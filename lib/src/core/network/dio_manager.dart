import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'exception_handler.dart';

/// Class that makes API call easier
class DioManager {
  final Dio dio = Dio();

  static final DioManager _instance = DioManager._internal();

  DioManager._internal();

  factory DioManager() => _instance;

  static void configure(String baseUrl) {
    _instance.dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = 20000
      ..sendTimeout = 20000
      ..receiveTimeout = 60000;

    if (!kReleaseMode)
      _instance.dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true));
  }

  /// DIO GET
  /// take [url], concrete route
  Future<Response> get(String url,
          {Map<String, dynamic>? headers, Map<String, dynamic>? json}) async =>
      await dio
          .get(url, queryParameters: json, options: Options(headers: headers))
          .then((response) => response)
          .catchError((error) {
        handleError(error);
      });

  /// DIO POST
  /// take [url], concrete route
  Future<Response> post(String url,
          {Map<String, dynamic>? headers, dynamic body}) async =>
      await dio
          .post(url, data: body, options: Options(headers: headers))
          .then((response) => response)
          .catchError((error) {
        handleError(error);
      });

  /// DIO PUT
  /// take [url], concrete route
  Future<Response> put(String url, {dynamic body, Options? options}) async {
    return await dio
        .put(url, data: body, options: options)
        .then((response) => response)
        .catchError((error) {
      handleError(error);
    });
  }

  /// DIO PATCH
  /// take [url], concrete route
  Future<Response> patch(String url, {dynamic body, Options? options}) async {
    return await dio
        .patch(url, data: body, options: options)
        .then((response) => response)
        .catchError((error) {
      handleError(error);
    });
  }

  /// DIO DELETE
  /// take [url], concrete route
  Future<Response> delete(String url,
          {Map<String, dynamic>? headers, dynamic body}) async =>
      await dio
          .delete(url, data: body, options: Options(headers: headers))
          .then((response) => response)
          .catchError((error) {
        handleError(error);
      });
}
