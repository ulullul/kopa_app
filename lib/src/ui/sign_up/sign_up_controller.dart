import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/getX/base_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUpController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
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
