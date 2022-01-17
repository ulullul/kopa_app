import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_app_example/src/widgets/splash_effect.dart';

class ActionButton extends BaseStatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor, shadowColor;
  final IconData icon;
  const ActionButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.shadowColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SplashEffect.circular(
        onTap: onTap,
        color: backgroundColor,
        child: Container(
          width: 65,
          height: 65,
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
