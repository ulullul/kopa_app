import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/data/services/log/log_service.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:flutter_app_example/src/ui/login/utils/login_form_fields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();

  final UserRepository _userRepository = Get.find();

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
          auth.signInWithCredential(authCredential);
        },
        verificationFailed: (authException) {
          hideProgress();
          Get.snackbar("error", authException.toString());
        },
        codeSent: (String id, [int? resendToken]) {
          hideProgress();
          this.verificationId = id;
          LogService().logPrint('asasdasd');
          showCode.value = true;
        },
        codeAutoRetrievalTimeout: (id) {
          this.verificationId = id;
          hideProgress();
        });
  }

  void verifyCode() async {
    try {
      if (!formKey.currentState!.saveAndValidate()) return;
      showProgress();
      final credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: this.verificationId,
          smsCode: formKey
              .currentState!.value[LoginFormFields.CODE.toSimpleString()],
        ),
      );
      if (credential.user != null) {
        final userData = await _userRepository.getUserData();
        showCode.value = false;
        isMethodChosen.value = false;
        LogService().logPrint(userData?.toString());
        userData == null
            ? Get.toNamed(Routes.SIGN_UP)
            : Get.offAllNamed(Routes.MAIN_SCREEN);
      }
    } catch (err, stackTrace) {
      handleError(err, stackTrace);
    } finally {
      hideProgress();
    }
  }
}
