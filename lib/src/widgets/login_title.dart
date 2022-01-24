import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/images.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTitle extends BaseStatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 00.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImages.loginBG),
          Text(
            'Вхід',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
