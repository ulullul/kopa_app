import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/ui/states/base_statefull_screen.dart';
import 'package:flutter_app_example/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_app_example/src/ui/home/home_controller.dart';
import 'package:flutter_app_example/src/ui/upsert_screen/widgets/block_header.dart';
import 'package:flutter_app_example/src/ui/utils/utils.dart';
import 'package:flutter_app_example/src/widgets/form/cupertino_select_form_field.dart';
import 'package:flutter_app_example/src/widgets/form/image_form_field.dart';
import 'package:flutter_app_example/src/widgets/form/underlined_form_text_field.dart';

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
        UnderlinedFormTextField(
          name: 'asd',
          hintText: '',
        ),
        BlockHeader(text: 'Матеріал'),
        CupertinoSelectFormField(
          name: 'asd',
          selectItems: ['a', 'b', 'c', 'd'],
        ),
        BlockHeader(text: 'Foto'),
        ImageFormField(),
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
