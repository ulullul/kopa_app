import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localization {
  /// [defaultLocaleCode] should be changed if en is not default
  static const defaultLocaleCode = 'en';
  static const defaultCountryCode = 'US';

  /// array of supported locale codes, default should be first
  static const localeArray = [defaultLocaleCode];

  /// get list of locales of codes
  static List<Locale> getSupportedLocales() {
    List<Locale> list = [];
    list.add(Locale(defaultLocaleCode, defaultCountryCode));
    // list.add(Locale('ru', 'RU'));
//    list.add(Locale('he', 'IS'));
    return list;
  }

  final Locale locale;

  Localization(this.locale);

  static Localization? of(BuildContext? context) {
    if (context == null) return null;
    return Localizations.of<Localization>(context, Localization);
  }

  /// get value by key in some locale
  String getValue(Map<String, String>? key) {
    if (key != null && key.containsKey(locale.languageCode)) {
      return key[locale.languageCode]!;
    } else {
      throw LocalizationException("No translation found");
    }
  }

  static String translate(BuildContext? context, Map<String, String>? key) {
    if (context == null || key == null) return "";
    return Localization.of(context)?.getValue(key) ?? "";
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      Localization.localeArray.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Localization.
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}

/// custom exception for throwing in [Localization] class
class LocalizationException implements Exception {
  final String msg;

  /// constructor of exception
  LocalizationException(this.msg);

  @override
  String toString() {
    return "LocalizationException ($msg)";
  }
}
