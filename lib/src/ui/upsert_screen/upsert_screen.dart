import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/home/home_controller.dart';
import 'package:flutter_app_example/src/ui/upsert_screen/widgets/block_header.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:flutter_app_example/src/widgets/form/outlined_form_text_field.dart';

class UpsertScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpsertScreenState();
  }
}

class UpsertScreenState
    extends BaseStatefulScreen<UpsertScreen, UpsertController> {
  @override
  UpsertController getController() => UpsertController();

  @override
  Widget buildBody() {
    return Column(
      children: [
        BlockHeader(text: 'Модель'),
        OutlinedFormTextField(
          name: 'asd',
          hintText: '',
        )
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return getAppBar(
      context,
      '',
      leading: getBack(),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text('Зберегти'),
        ),
      ],
    );
  }
}
