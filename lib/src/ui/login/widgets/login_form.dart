import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_app_example/src/ui/login/utils/login_form_fields.dart';
import 'package:flutter_app_example/src/widgets/form/bordered_form_text_field.dart';
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
          BorderedFormTextField(
            name: LoginFormFields.PHONE.toSimpleString(),
            hintText: 'Номер телефону',
          ),
        ],
      ),
    );
  }
}
