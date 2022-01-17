import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository.dart';
import 'package:flutter_app_example/src/data/repositories/task/task_repository_impl.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository_impl.dart';
import 'package:get/get.dart';

enum Flavor { DEV, PROD }

class GlobalBinding extends Bindings {
  static late Flavor flavor;

  GlobalBinding(Flavor _flavor) {
    flavor = _flavor;
  }

  @override
  void dependencies() {
    // if (flavor == Flavor.DEV) {
    //   DioManager.configure(devServerUrl);
    // } else if (flavor == Flavor.PROD) {
    //   DioManager.configure(prodServerUrl);
    // }

    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(), fenix: true);

    Get.lazyPut<TaskRepository>(() => TaskRepositoryImpl(), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);

  }
}
