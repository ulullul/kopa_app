import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyFormatters extends TextInputFormatter {
  static final _reg = RegExp("[1-9]");

  // <TextInputFormatter>[
  //   FilteringTextInputFormatter.allow(RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')), // (RegExp("[1-9]")
  // ],

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return _reg.hasMatch(newValue.text) ? newValue : oldValue;
  }
}