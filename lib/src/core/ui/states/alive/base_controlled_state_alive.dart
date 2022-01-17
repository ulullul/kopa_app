import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/core/ui/states/base_controlled_state.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

abstract class BaseControlledStateAlive<B extends BaseStatefulWidget,
        C extends BaseController> extends BaseControlledState<B, C>
    with AutomaticKeepAliveClientMixin {
  BaseControlledStateAlive({String? tag}) : super(tag: tag);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<C>(
      tag: tag,
      builder: (context) {
        if (controller.globalProgress) {
          return Stack(
            children: <Widget>[getLayout(), getProgress()],
          );
        }
        return getLayout();
      },
    );
  }
}
