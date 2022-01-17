import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/icons.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';

import 'action_button.dart';

class LoginTypesButtons extends BaseStatelessWidget {
  final VoidCallback phone, google, facebook;

  const LoginTypesButtons({
    Key? key,
    required this.phone,
    required this.facebook,
    required this.google,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ActionButton(
          icon: AppIcons.phone,
          onTap: phone,
          shadowColor: const Color(0xff5ba32e),
          backgroundColor: const Color(0xff42ff00),
        ),
        ActionButton(
          icon: AppIcons.facebook,
          onTap: facebook,
          shadowColor: const Color(0x3f43419b),
          backgroundColor: const Color(0xff43419b),
        ),
        ActionButton(
          icon: AppIcons.google,
          onTap: google,
          shadowColor: const Color(0xcfff0000),
          backgroundColor: const Color(0xffff0000),
        ),
      ],
    );
  }
}
