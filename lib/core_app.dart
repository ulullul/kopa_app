import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_example/core_app_controller.dart';
import 'package:flutter_app_example/main.dart';
import 'package:flutter_app_example/resources/strings.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/router/app_pages.dart';
import 'package:flutter_app_example/src/core/localization/app_localizations.dart';
import 'package:flutter_app_example/src/core/ui/states/base_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// widget of app and its configuration
class CoreApp extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CoreAppState();
  }
}

class CoreAppState extends BaseControlledState<CoreApp, CoreAppController>
    with WidgetsBindingObserver {
  @override
  CoreAppController getController() => CoreAppController();

  @override
  Widget getLayout() {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        Get.locale = Localizations.localeOf(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1, devicePixelRatio: window.devicePixelRatio),
          child: child ?? const Offstage(),
        );
      },
      transitionDuration: AppPages.transitionDuration,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: Localization.getSupportedLocales(),
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode)
            return supportedLocaleLanguage;
        }

        // If device not support with locale to get language code then default get first on from the list
        return supportedLocales.first;
      },
      title: AppTitle,
      theme: buildThemeData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoutePage,
      initialBinding: globalBinding,
    );
  }
}
