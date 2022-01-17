import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogException implements Exception {
  final String msg;

  LogException(this.msg);

  @override
  String toString() {
    return 'LogException{msg: $msg}';
  }
}

class LogService {
  LogService._internal();

  static LogService? _instance;

  factory LogService() {
    if (_instance == null) _instance = LogService._internal();
    return _instance!;
  }

  Logger _logger = Logger();

  void log(dynamic err, [StackTrace? stackTrace]) {
    if (kReleaseMode) {
      notifyCrashlytics(err, stackTrace, shouldPrint: false);
      return;
    }
    if (err is Exception) {
      _logger.e(err.toString(), err, stackTrace);
    } else if (err is Error) {
      _logger.e(err.toString(), err, err.stackTrace);
    } else
      _logger.e(err);
  }

  void logPrint(String message, [Level? logLevel, StackTrace? stackTrace]) {
    if (logLevel == null)
      _logger.i(message, null, stackTrace);
    else
      _logger.log(logLevel, message, null, stackTrace);
  }

  void notifyCrashlytics(dynamic err, StackTrace? stackTrace,
      {bool? shouldPrint = true}) {
    if (err is SocketException) return;
    if (err is TimeoutException) return;
    if (shouldPrint == null) shouldPrint = true;
    if (!kReleaseMode && shouldPrint) print(err);
    // else
    //   FirebaseCrashlytics.instance.recordError(err, stackTrace);
  }
}
