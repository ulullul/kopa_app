import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/custom/refresh_button.dart';
import 'package:flutter_app_example/src/ui/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState
    extends BaseStatefulScreen<SplashScreen, SplashController>
    with SingleTickerProviderStateMixin {
  @override
  SplashController getController() => SplashController();

  AnimationController? animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.ease,
    );

    animationController?.repeat(reverse: true, min: 0.1);
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ScaleTransition(
                      scale: animation,
                      child: FlutterLogo(size: MediaQuery.of(context).size.width/2,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Obx(
                    () {
                      if (controller.isError.isTrue) {
                        return RefreshButton(
                          onPressed: controller.loadData,
                        );
                      }
                      return const Offstage();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: ObxValue<RxString>((rxValue) {
            return Text(
              rxValue.value,
              style: getWhite16(),
              textAlign: TextAlign.center,
            );
          }, controller.version),
        )
      ],
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }
}
