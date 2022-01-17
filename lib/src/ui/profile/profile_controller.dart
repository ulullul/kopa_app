import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();

  String firstName = "";
  String lastName = "";
  String email = "";

  final UserRepository repository = Get.find();
  final Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  @override
  void onInit() async {
    _user.bindStream(repository.streamUserData());
    initListener();
    super.onInit();
  }

  void setDataUserParameters() async {
    showProgress();
    await repository.updateUser(user);
    hideProgress();
  }

  void initListener() {
    controllerFirstName.addListener(() {
      _user.value.firstName = controllerFirstName.text.trim();
    });
    controllerLastName.addListener(() {
      _user.value.lastName = controllerLastName.text.trim();
    });
    controllerEmail.addListener(() {
      _user.value.email = controllerEmail.text.trim();
    });
  }

  void logout() async {
    showProgress();
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Routes.ROOT);
      hideProgress();
    } catch (err, stackTrace) {
      handleError(err, stackTrace);
    }
  }
}
