import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/core_app.dart';
import 'package:flutter_app_example/lifecycle_handler.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/src/core/data/services/statusbar_colorizer.dart';
import 'package:flutter_app_example/src/core/network/custom_http_overrides.dart';
import 'package:flutter_app_example/src/di/global_binding.dart';


final GlobalBinding globalBinding = GlobalBinding(Flavor.DEV);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = CustomHttpOverrides();
  await StatusBarColorizer().updateStatusBar(colorPrimaryDark);
  WidgetsBinding.instance
      ?.addObserver(LifecycleEventHandler(resumeCallBack: () async {
    await StatusBarColorizer().updateStatusBar(StatusBarColorizer().lastColor);
  }));

  Future<void> run() async {
    var app = CoreApp();
    runApp(app);
  }

  if (kReleaseMode) {
    runZoned(run);
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // runZonedGuarded<Future<void>>(
    //     run, FirebaseCrashlytics.instance.recordError);
  } else {
    runZoned(run);
  }
}
