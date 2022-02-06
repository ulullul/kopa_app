import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UnderlinedFormTextField extends BaseStatelessWidget {
  final String name, hintText;
  final EdgeInsets? padding;
  final FormFieldValidator<String>? validator;
  final String? initialValue;

  const UnderlinedFormTextField({
    Key? key,
    required this.name,
    required this.hintText,
    this.padding,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      initialValue: initialValue,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 35,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        errorStyle: TextStyle(
          fontSize: 9,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
