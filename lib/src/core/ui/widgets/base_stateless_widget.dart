import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/show_message_mixin.dart';

/// every StatelessWidget should be inherited from this
abstract class BaseStatelessWidget extends StatelessWidget
    with ShowMessageMixin {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }
}
