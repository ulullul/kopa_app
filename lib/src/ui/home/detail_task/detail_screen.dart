
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/home/detail_task/detail_controller.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:get/get.dart';

class DetailScreen extends BaseStatefulWidget {
  final String taskTransit;
  final String dateTask;
  DetailScreen({
    required this.taskTransit,
    required this.dateTask,
  });

  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState
    extends BaseStatefulScreen<DetailScreen, DetailController> {
  @override
  DetailController getController() => DetailController();

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.dateTask),
            SizedBox(
              height: 15.0,
            ),
            SelectableText(widget.taskTransit,
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(context, "DetailScreen Screen", leading: getBack());
  }

}
