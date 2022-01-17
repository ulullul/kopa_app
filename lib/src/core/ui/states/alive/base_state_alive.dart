import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/show_message_mixin.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/core/ui/states/base_state.dart';

abstract class BaseStateAlive<B extends BaseStatefulWidget> extends BaseState<B>
    with ShowMessageMixin, AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getLayout();
  }
}
