import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_app_example/src/ui/login/utils/login_form_fields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginForm extends BaseStatelessWidget {
  final Key formKey;
  const LoginForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: LoginFormFields.PHONE.toSimpleString(),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              constraints: const BoxConstraints(
                maxHeight: 40,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              hintText: 'Номер телефону',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
