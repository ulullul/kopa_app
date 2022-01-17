import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_example/resources/strings.dart';
import 'package:flutter_app_example/src/core/ui/show_message_mixin.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseState<B extends BaseStatefulWidget> extends State<B>
    with ShowMessageMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Hides keyboard if opened
  Future hideKeyboard() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// Should be overridden in extended widget
  Widget getLayout();

  /// Method to show message
  /// Params: [msg]
  void showMessage(String msg) {
    showMessageM(msg);
  }

  /// Method to show message by resource
  /// Params: [msgRes]
  void showMessageRes(Map<String, String> msgRes) {
    showMessageResM(context, msgRes);
  }

  /// Method to launch url if possible
  /// Otherwise - display warning
  /// Params: [url]
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showMessageResM(context, unableToOpen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}
