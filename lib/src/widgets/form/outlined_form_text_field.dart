import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class OutlinedFormTextField extends BaseStatelessWidget {
  final String name, hintText;
  final EdgeInsets? padding;
  final FormFieldValidator<String>? validator;
  final String? initialValue;

  const OutlinedFormTextField({
    Key? key,
    required this.name,
    required this.hintText,
    this.padding,
    this.validator,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: FormBuilderTextField(
        name: name,
        validator: validator,
        initialValue: initialValue,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 25,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          errorStyle: const TextStyle(
            fontSize: 9,
            color: Color(0xffE80909),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0x60ffffff),
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0x60ffffff),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0xffffffff),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0x99ff0000),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color(0xffff0000),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
