import 'package:flutter_app_example/resources/strings.dart';
import 'package:flutter_app_example/src/core/ui/states/base_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:url_launcher/url_launcher.dart';

mixin PolicyMixin<T extends BaseStatefulWidget> on BaseState<T> {
  openPolicy() async {
    if (await canLaunch(policyUrl)) {
      await launch(policyUrl);
    } else {
      showMessageRes(unableToOpen);
    }
  }
}
