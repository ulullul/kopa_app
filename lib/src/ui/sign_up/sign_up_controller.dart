import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';
import 'package:flutter_app_example/src/ui/sign_up/utils/sign_up_form_fields.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final UserRepository _userRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  final _currentUser = FirebaseAuth.instance.currentUser;

  /*TaskRepository repository = Get.find();
  var firebaseUser = FirebaseAuth.instance.currentUser;

  RxList<Task> list = <Task>[].obs;
  String? idRemove;

  String replacementFlag = "list";
*/
  @override
  void onInit() async {
//    list.bindStream(TaskRepository.to.getData());
//     list.bindStream(repository.getTaskList(firebaseUser?.uid ?? ""));
    super.onInit();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.saveAndValidate()) return;
    final form = formKey.currentState!.value;
    _authRepository.createUser(
      UserModel(
        id: _currentUser!.uid,
        phone: _currentUser!.phoneNumber,
        firstName: form[SignUpFormFields.FIRST_NAME.toSimpleString()],
        lastName: form[SignUpFormFields.LAST_NAME.toSimpleString()],
        city: form[SignUpFormFields.CITY.toSimpleString()],
      ),
    );
    Get.offAllNamed(Routes.MAIN_SCREEN);
  }

  /*void deleteTask(Task item) async {
    showContentProgress();
    for (var i in list) {
      if (item.id == i.id) {
        await repository.deleteTask(item);
        hideContentProgress();
      }
    }
  }

  void deleteListTask() async {
    showContentProgress();
    await repository.deleteListTask();
    hideContentProgress();
  }*/

  // void home() async {
  //   try {
  //     showProgress();
  //     // DO LOGIN
  //     // await _authRepository.login();
  //     hideProgress();
  //   } catch (err) {
  //     handleError(err);
  //   }
  // }

}
