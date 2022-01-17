import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/states/base_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:get/get.dart';

abstract class BaseSharedControlledState<B extends BaseStatefulWidget,
    C extends BaseController> extends BaseState<B> {
  @protected
  C controller = Get.find<C>();

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}
