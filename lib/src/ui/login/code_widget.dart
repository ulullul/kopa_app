import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_shared_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';
import 'package:get/get.dart';

class CodeWidget extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CodeWidgetState();
  }
}

class CodeWidgetState
    extends BaseSharedControlledState<CodeWidget, LoginController> {
  @override
  Widget getLayout() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            child: FlutterLogo(size: 126),
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .15,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .14,
          child: Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .28,
          left: 15,
          right: 15,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: controller.controllerCode,
                      focusNode: controller.codeFocus,
                      keyboardType: TextInputType.phone,
                      decoration: getDecoration('  input code', '', 'Code', '',
                          Icons.unsubscribe_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    height: 55.0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (controller.controllerCode.text == "" ||
                            controller.controllerCode.text.isEmpty) {
                          _showDialog();
                        } else {
                          controller.verifyCode(controller.controllerCode.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: colorAccent),
                      label: const Text("Verify",
                          style:
                              TextStyle(fontSize: 22.0, color: Colors.black)),
                      icon: const Icon(
                        Icons.login,
                        color: Colors.black,
                        size: 34.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: const Text("Registered"),
      content: const Text("Input number code"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent, // background
            onPrimary: Colors.black, // foreground
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("Close"), // cancel, //
        ),
      ],
    ));
  }
}
