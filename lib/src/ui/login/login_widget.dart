import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_shared_controlled_state.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';
import 'package:flutter_app_example/src/ui/login/widgets/login_form.dart';
import 'package:flutter_app_example/src/ui/login/widgets/login_types_buttons.dart';
import 'package:get/get.dart';

class LoginWidget extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginWidgetState();
  }
}

class LoginWidgetState
    extends BaseSharedControlledState<LoginWidget, LoginController> {
  @override
  Widget getLayout() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: ObxValue<RxBool>(
        (value) {
          if (value.value) {
            return LoginForm(
              formKey: controller.formKey,
              isCodeSent: controller.showCode,
              onVerify: controller.verifyPhone,
              onNext: controller.verifyCode,
            );
          }
          return LoginTypesButtons(
            phone: () {
              controller.isMethodChosen.value = true;
            },
            facebook: () {},
            google: () {},
          );
        },
        controller.isMethodChosen,
      ),
    );
  }
}
