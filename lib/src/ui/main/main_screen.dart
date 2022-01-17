import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/icon_button.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/addition_screen.dart';
import 'package:flutter_app_example/src/ui/home/home_screen.dart';
import 'package:flutter_app_example/src/ui/main/main_controller.dart';
import 'package:flutter_app_example/src/ui/profile/profile_screen.dart';
import 'package:get/get.dart';

class MainScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends BaseStatefulScreen<MainScreen, MainController> {
  @override
  MainController getController() => MainController();

  int pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget buildBody() {
    return Scaffold(
        appBar: buildAppbar(),
        body: pageList[pageIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AdditionScreen());
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          elevation: 5.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: const Color(0xFFffffb3),
            notchMargin: 6.0,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 54.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: IconTextButton(
                      icon: Icon(Icons.home,
                          color: pageIndex == 0 ? colorAccent : Colors.black),
                      label: "Home",
                      labelStyle: TextStyle(
                          color: pageIndex == 0 ? colorAccent : Colors.black),
                      onTap: () {
                        _onItemTapped(0);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: IconTextButton(
                      icon: Icon(Icons.account_box_outlined,
                          color: pageIndex == 1 ? colorAccent : Colors.black),
                      label: "Profile",
                      labelStyle: TextStyle(
                          color: pageIndex == 1 ? colorAccent : Colors.black),
                      onTap: () {
                        _onItemTapped(1);
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
    //return getAppBar(context, "MainScreen", leading: getBack());
  }

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];
}

