import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/ui/login/login_screen.dart';
import 'package:flutter_app_example/src/ui/sign_up/sign_up_screen.dart';
import 'package:flutter_app_example/src/ui/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const String INITIAL = Routes.ROOT;
  static const Duration transitionDuration = const Duration(milliseconds: 350);
  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpScreen(),
    ),
  ];
  static final unknownRoutePage =
      GetPage(name: Routes.ROOT, page: () => SplashScreen());
}
