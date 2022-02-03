import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';

class BlockHeader extends BaseStatelessWidget {
  final String text;
  final bool? verticalPadding;
  const BlockHeader({
    Key? key,
    required this.text,
    this.verticalPadding = false,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Padding(
      padding: verticalPadding!
          ? const EdgeInsets.all(17.0)
          : const EdgeInsets.symmetric(horizontal: 17.0),
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).accentColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
