import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RefreshButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 64,
      icon: Icon(
        Icons.refresh,
        color: colorAccent,
      ),
      onPressed: onPressed,
    );
  }
}
