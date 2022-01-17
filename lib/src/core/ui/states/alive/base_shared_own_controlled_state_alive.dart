import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_app_example/src/core/ui/states/base_shared_own_controlled_state.dart';

abstract class BaseSharedOwnControlledStateAlive<
        B extends BaseStatefulWidget,
        C extends BaseController,
        S extends BaseController> extends BaseSharedOwnControlledState<B, C, S>
    with AutomaticKeepAliveClientMixin {
  BaseSharedOwnControlledStateAlive({String? tag}) : super(tag: tag);

  @protected
  S sharedController = Get.find<S>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getLayout();
  }
}
