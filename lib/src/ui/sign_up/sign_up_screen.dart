import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/login/widgets/login_title.dart';
import 'package:flutter_app_example/src/ui/sign_up/utils/sign_up_form_fields.dart';
import 'package:flutter_app_example/src/widgets/app_button.dart';
import 'package:flutter_app_example/src/widgets/form/bordered_form_text_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'sign_up_controller.dart';

class SignUpScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState
    extends BaseStatefulScreen<SignUpScreen, SignUpController> {
  @override
  SignUpController getController() => SignUpController();

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: LoginTitle(),
            ),
          ),
          FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                BorderedFormTextField(
                  name: SignUpFormFields.NAME.toSimpleString(),
                  hintText: "Iм'я",
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: 'Поле не може бути порожнім'),
                    (candidate) {
                      if (candidate!.contains(RegExp(r'[0-9]'))) {
                        return 'Поле не повинно містити цифр';
                      }
                      return null;
                    },
                  ]),
                ),
                BorderedFormTextField(
                  name: SignUpFormFields.SURNAME.toSimpleString(),
                  hintText: 'Прізвище',
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      context,
                      errorText: 'Поле не може бути порожнім',
                    ),
                    (candidate) {
                      if (candidate!.contains(RegExp(r'[0-9]'))) {
                        return 'Поле не повинно містити цифр';
                      }
                      return null;
                    },
                  ]),
                ),
                BorderedFormTextField(
                  name: SignUpFormFields.CITY.toSimpleString(),
                  hintText: 'Місто',
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        context,
                        errorText: 'Поле не може бути порожнім',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //TODO: thing about widget for a button and move color to theme
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onTap: () {},
                    text: 'Готово',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}
