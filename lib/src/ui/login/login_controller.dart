import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:flutter_app_example/src/ui/login/utils/login_form_fields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();

  final AuthRepository _authRepository = Get.find();

  String verificationId = "";
  RxBool showCode = false.obs;

  RxBool isMethodChosen = false.obs;

  var auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {
    if (!formKey.currentState!.saveAndValidate()) return;
    showProgress();
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 40),
        phoneNumber:
            formKey.currentState!.value[LoginFormFields.PHONE.toSimpleString()],
        verificationCompleted: (AuthCredential authCredential) {
//          auth.signInWithCredential(authCredential);
        },
        verificationFailed: (authException) {
          hideProgress();
          Get.snackbar("error", "problem code");
        },
        codeSent: (String id, [int? resendToken]) {
          hideProgress();
          print(resendToken);
          this.verificationId = id;
          showCode.value = true;
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationId = id;
          hideProgress();
        });
  }

  void verifyCode(String code) async {
    try {
      showProgress();
      var credential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verificationId, smsCode: code));
      if (credential.user != null) {
        await _authRepository.createUser(credential.user!);
        Get.offAllNamed(Routes.MAIN_SCREEN);
      }
      hideProgress();
    } catch (err, stackTrace) {
      handleError(err, stackTrace);
    }
  }
}
