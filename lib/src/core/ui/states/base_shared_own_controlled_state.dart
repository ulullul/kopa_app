import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/states/base_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:get/get.dart';

abstract class BaseSharedOwnControlledState<
    B extends BaseStatefulWidget,
    C extends BaseController,
    S extends BaseController> extends BaseControlledState<B, C> {
  BaseSharedOwnControlledState({String? tag}) : super(tag: tag);

  @protected
  S sharedController = Get.find<S>();

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}
