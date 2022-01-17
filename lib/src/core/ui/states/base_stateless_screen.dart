import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';

abstract class BaseStatelessScreen extends BaseStatelessWidget {
  BaseStatelessScreen({Key? key}) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context),
        body: buildBody(context),
      ),
    );
  }

  /// should be overridden in extended widget
  PreferredSizeWidget? buildAppbar(BuildContext context);

  /// should be overridden in extended widget
  Widget buildBody(BuildContext context);
}
