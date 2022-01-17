import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/ui/splash/splash_timer_mixin.dart';
import 'package:flutter_app_example/src/utils/async/future_chain.dart';
import 'package:get/get.dart';

class SplashController extends BaseController with SplashTimerMixin {
  late FutureChain _initChain = FutureChain(
      data: [
        _getUserIsLoggedIn,
      ],
      onError: (index, err, stackTrace) {
        handleError(err, stackTrace);
      });
  final RxString version = "".obs;

  @override
  void onInit() {
    super.onInit();
    startTimeout();
    loadData();
  }

  void loadData() {
    resetError();
    _initChain.startPerformance();
  }

  Future<void> _getUserIsLoggedIn() async {
    if (FirebaseAuth.instance.currentUser == null) {
      nextRoute = Routes.LOGIN;
    } else {
      nextRoute = Routes.MAIN_SCREEN;
    }
  }
}
