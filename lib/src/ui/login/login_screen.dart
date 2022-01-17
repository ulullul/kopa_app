import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/images.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/login_controller.dart';
import 'package:flutter_app_example/src/ui/login/login_widget.dart';
import 'package:flutter_app_example/src/ui/login/widgets/login_title.dart';

class LoginScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState
    extends BaseStatefulScreen<LoginScreen, LoginController> {
  @override
  LoginController getController() => LoginController();

  @override
  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppImages.mainLogo),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LoginTitle(),
              LoginWidget(),
            ],
          ),
        )
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}
