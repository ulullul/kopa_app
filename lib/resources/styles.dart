import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();

  return ThemeData(
      brightness: Brightness.light,
      primaryColor: colorPrimary,
      accentColor: colorAccent,
      // dividerColor: colorGrey18,
      primaryColorDark: colorPrimaryDark,
      scaffoldBackgroundColor: colorPrimary,
      primaryTextTheme:
          _buildTextTheme(baseTheme.primaryTextTheme, colorPrimaryText),
      buttonColor: colorPrimary,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(colorAccent))),
      textTheme: _buildTextTheme(baseTheme.textTheme, colorPrimaryText));
}

TextTheme _buildTextTheme(TextTheme base, Color color) {
  return base
      .copyWith(
        headline5: base.headline5?.copyWith(fontWeight: FontWeight.w500),
        headline6: base.headline6?.copyWith(fontSize: 18.0),
        caption:
            base.caption?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      )
      .apply(fontFamily: 'Arial', displayColor: color, bodyColor: color);
}

TextStyle? getAppBarTheme(BuildContext context) {
  return Theme.of(context)
      .copyWith()
      .textTheme
      .headline6
      ?.copyWith(color: colorPrimaryText);
}

TextStyle getWhite16() {
  return const TextStyle(color: colorWhiteText, fontSize: 16);
}

TextStyle getBlack16() {
  return const TextStyle(color: colorBlackText, fontSize: 16);
}

TextStyle getBlack22() {
  return const TextStyle(color: colorBlackText, fontSize: 22);
}

InputDecoration getDecoration(String hintText, String helperText,
    String labelText, String prefixText, IconData iconData) {
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorAccent)),
      border: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorAccent)),
      hintText: hintText, // 'input Phone'
      hintStyle: const TextStyle(color: hintStyleTextField),
//      helperText: helperText, // '+38...',
      labelText: labelText, // 'Phone',
      labelStyle: const TextStyle(color: colorBlackText),
      prefixIcon: Icon(iconData, color: colorAccent),
      prefixText: prefixText, // '№ ',
      prefixStyle: const TextStyle(color: colorAccent));
}
