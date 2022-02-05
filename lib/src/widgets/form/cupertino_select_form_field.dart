import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/src/core/data/services/log/log_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CupertinoSelectFormField extends StatefulWidget {
  final String name;
  final List<String> selectItems;
  final String? initialValue;
  const CupertinoSelectFormField(
      {Key? key,
      required this.name,
      required this.selectItems,
      this.initialValue})
      : super(key: key);

  @override
  _CupertinoSelectFormFieldState createState() =>
      _CupertinoSelectFormFieldState();
}

class _CupertinoSelectFormFieldState extends State<CupertinoSelectFormField> {
  late int _currentIndex;
  final _focusNode = FocusNode(canRequestFocus: true);

  bool isFocused = false;

  @override
  void initState() {
    _currentIndex = widget.initialValue == null
        ? 0
        : widget.selectItems.indexOf(widget.initialValue!);
    super.initState();
  }

  void openPicker(BuildContext context, FormFieldState<String> field) {
    setState(() {
      _focusNode.requestFocus();
    });
    showCupertinoModalPopup<String>(
        context: context,
        builder: (ctx) {
          return Container(
            height: 200,
            color: Colors.white,
            width: MediaQuery.of(ctx).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: Get.back,
                      child: Text(
                        'Відміна',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        field.didChange(widget.selectItems[_currentIndex]);
                        Get.back();
                      },
                      child: Text('Зберегти'),
                    ),
                  ],
                ),
                Expanded(
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 30,
                    scrollController: FixedExtentScrollController(
                      initialItem: widget.selectItems.indexWhere(
                        (element) => field.value == element,
                      ),
                    ),
                    useMagnifier: true,
                    magnification: 1.1,
                    selectionOverlay: DecoratedBox(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: const Color(0xFFADADAD),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    children: widget.selectItems
                        .map(
                          (el) => Text(
                            el,
                            style: const TextStyle(fontSize: 23),
                          ),
                        )
                        .toList(),
                    onSelectedItemChanged: (index) {
                      _currentIndex = index;
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Color _getBorderColor(FormFieldState<String> field) {
    //TODO: fix focus
    LogService().log(_focusNode.hasPrimaryFocus);
    if (field.hasError) {
      return Theme.of(context)
          .inputDecorationTheme
          .errorBorder!
          .borderSide
          .color;
    }

    if (_focusNode.hasFocus) {
      return Theme.of(context)
          .inputDecorationTheme
          .focusedBorder!
          .borderSide
          .color;
    }

    if (field.hasError && _focusNode.hasFocus) {
      return Theme.of(context)
          .inputDecorationTheme
          .focusedErrorBorder!
          .borderSide
          .color;
    }

    return Theme.of(context).inputDecorationTheme.border!.borderSide.color;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      focusNode: _focusNode,
      builder: (field) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => openPicker(context, field),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  field.value ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Container(
                height: 1,
                color: _getBorderColor(field),
                // width: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
