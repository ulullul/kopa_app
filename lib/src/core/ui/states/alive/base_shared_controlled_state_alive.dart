import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/states/base_shared_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';

abstract class BaseSharedControlledStateAlive<B extends BaseStatefulWidget,
        C extends BaseController> extends BaseSharedControlledState<B, C>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getLayout();
  }

  @override
  bool get wantKeepAlive => true;
}
