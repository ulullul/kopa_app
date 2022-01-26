import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:flutter_app_example/src/ui/login/utils/login_form_fields.dart';
import 'package:flutter_app_example/src/widgets/app_button.dart';
import 'package:flutter_app_example/src/widgets/form/bordered_form_text_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginForm extends BaseStatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final RxBool isCodeSent;
  final VoidCallback onVerify, onNext;

  const LoginForm({
    Key? key,
    required this.formKey,
    required this.isCodeSent,
    required this.onVerify,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          ObxValue<RxBool>(
            (val) {
              if (!val.value)
                return BorderedFormTextField(
                  name: LoginFormFields.PHONE.toSimpleString(),
                  hintText: 'Номер телефону',
                );
              return BorderedFormTextField(
                name: LoginFormFields.CODE.toSimpleString(),
                hintText: 'Код верифікації номеру',
                validator: FormBuilderValidators.compose([
                  (value) {
                    if (formKey
                            .currentState
                            ?.fields[LoginFormFields.PHONE.toSimpleString()]
                            ?.value !=
                        null) {
                      return FormBuilderValidators.required(context)(value);
                    }
                    return null;
                  }
                ]),
              );
            },
            isCodeSent,
          ),
          ObxValue<RxBool>(
            (val) {
              return AppButton(
                onTap: val.value ? onNext : onVerify,
                text: val.value ? 'Далі' : 'Верифікувати',
              );
            },
            isCodeSent,
          ),
        ],
      ),
    );
  }
}
