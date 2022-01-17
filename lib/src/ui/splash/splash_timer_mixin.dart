import 'dart:async';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:get/get.dart';

mixin SplashTimerMixin on BaseController {
  final int _secondsBeforeStop = 2;
  int _curTime = 0;
  String? nextRoute;
  Timer? _timer;

  void startTimeout() {
    var duration = const Duration(seconds: 1);
    _timer = Timer.periodic(duration, _handleTimeout);
  }

  void _handleTimeout(Timer timer) {
    _curTime++;
    if (nextRoute != null &&
        nextRoute!.isNotEmpty &&
        _curTime > _secondsBeforeStop) {
      Get.offAllNamed(nextRoute!);
      timer.cancel();
    }
  }

  @override
  void dispose() {
    if (_timer != null && _timer?.isActive == true) _timer?.cancel();
    super.dispose();
  }
}
