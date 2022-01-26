import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';

class AppButton extends BaseStatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF0CCDE6),
        fixedSize: const Size(280, 34),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
