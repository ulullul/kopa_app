
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/colors.dart';
import 'package:flutter_app_example/resources/styles.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/addition/addition_controller.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

class AdditionScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdditionScreenState();
  }
}

class AdditionScreenState
    extends BaseStatefulScreen<AdditionScreen, AdditionController> {
  @override
  AdditionController getController() => AdditionController();

  String textTask = "";

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: TextField(
                onChanged: (text) {
                  textTask = text;
                },
                controller: controller.controllerTextTask,
                cursorColor: colorAccent,
                maxLines: null,
                minLines: null,
                expands: true,
                style: getBlack16(),
                decoration: const InputDecoration(
                  fillColor: colorPrimaryDark,
                  filled: true,
                  isCollapsed: true,
                  contentPadding:
                  const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorAccent, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  hintText: "Input task",
                )),
          ),
          Container(
            height: 58.0,
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                if (controller.controllerTextTask.text.isNotEmpty) {
                  controller.saveDate(controller.controllerTextTask.text.trim());
                } else {
                  _showDialog();
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colorAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          side: BorderSide(color: colorPrimaryDark)))),
              label: Text("Save task", style: getBlack22()),
              icon: const Icon(
                Icons.assignment_turned_in,
                color: Colors.black,
                size: 34.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(context, "Addition Screen", leading: getBack());
  }

  void _showDialog() {
    Get.dialog(AlertDialog(
      backgroundColor: colorPrimaryDark,
      title: const Text("Task"),
      content: const Text("To save, first enter the task"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorAccent, // background
            onPrimary: Colors.black, // foreground
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("Close"), // cancel, //
        ),
      ],
    ));
  }
}

