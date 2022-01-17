import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/strings.dart';
import 'package:flutter_app_example/src/core/localization/app_localizations.dart';

Decoration getBackgroundGradient() {
  return BoxDecoration(
    // Box decoration takes a gradient
    gradient: LinearGradient(
      // Where the linear gradient begins and ends
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: [0.3, 0.7],
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Color(0xffFFFFFF),
        Color(0xffD8D8D8)
      ],
    ),
  );
}

Widget getAppbarWithLogo(
    {PreferredSizeWidget? bottom, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    elevation: 0,
    title: Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.all(16.0),
      child: Image.asset("assets/logo.png"),
    ),
    centerTitle: true,
    leading: leading ?? const Offstage(),
    bottom: bottom,
    actions: actions,
  );
}

Widget getBack() => BackButton(color: colorWhiteText);

Widget getProgress({bool wrap = false, bool background = true}) {
  if (wrap) {
    return Center(
      heightFactor: 0,
      child: CircularProgressIndicator(),
    );
  }
  return Stack(children: <Widget>[
    background
        ? Container(
            color: Color.fromARGB(160, 0, 0, 0),
          )
        : const Offstage(),
    Center(
      child: CircularProgressIndicator(),
    )
  ]);
}

void showAlert(BuildContext context, String title, String msg, Function onOk,
    {Function? onCancel, String? okButtonTitle, String? cancelButtonTitle}) {
  if (kIsWeb || Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            msg,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                cancelButtonTitle ??
                    Localization.of(context)?.getValue(cancel) ??
                    "",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) {
                  onCancel();
                }
              },
            ),
            TextButton(
              child: Text(
                okButtonTitle ?? Localization.of(context)?.getValue(ok) ?? "",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onOk();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
            child: Text(cancelButtonTitle ??
                Localization.of(context)?.getValue(cancel) ??
                ""),
            onPressed: () {
              Navigator.of(context).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
          CupertinoDialogAction(
            child: Text(
                okButtonTitle ?? Localization.of(context)?.getValue(ok) ?? ""),
            onPressed: () {
              Navigator.of(context).pop();
              onOk();
            },
          )
        ],
      ),
    );
  }
}

AppBar getAppBar(BuildContext context, String title,
    {Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor = colorPrimary}) {
  return AppBar(
    elevation: 0.0,
    leading: leading,
    centerTitle: false,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 20, color: colorWhiteText),
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
    actions: actions,
  );
}
