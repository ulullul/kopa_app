import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class StatusBarColorizer {
  static StatusBarColorizer? _instance;

  StatusBarColorizer._internal();

  factory StatusBarColorizer() {
    if (_instance == null) _instance = StatusBarColorizer._internal();
    return _instance!;
  }

  Color _lastColor = colorPrimaryDark;

  Color get lastColor => _lastColor;

  Future<void> updateStatusBar(Color color) async {
    _lastColor = color;
    await FlutterStatusbarcolor.setStatusBarColor(color);
    if (useWhiteForeground(color)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
