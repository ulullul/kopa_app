import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/states/base_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

abstract class BaseControlledState<B extends BaseStatefulWidget,
    C extends BaseController> extends BaseState<B> {
  final String? tag;

  C getController();

  @protected
  late C controller;

  BaseControlledState({this.tag}) {
    controller = getController();
    Get.put<C>(controller, tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<C>(
      tag: tag,
      builder: (context) {
        if (controller.globalProgress) {
          return Stack(
            children: <Widget>[
              getLayout(),
              getProgress(),
            ],
          );
        }
        return getLayout();
      },
    );
  }

  @override
  void dispose() {
    Get.delete<C>(tag: tag);
    super.dispose();
  }
}
