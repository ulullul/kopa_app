import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/core/ui/states/base_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';

abstract class BaseStatefulScreen<B extends BaseStatefulWidget,
    C extends BaseController> extends BaseControlledState<B, C> {
  BaseStatefulScreen({String? tag}) : super(tag: tag);

  @override
  Widget getLayout() {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: buildAppbar(),
        body: buildBody(),
        floatingActionButton: buildFab(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  /// should be overridden in extended widget
  PreferredSizeWidget? buildAppbar();

  /// should be overridden in extended widget
  Widget buildBody();

  Widget? buildFab() {
    return null;
  }
}
