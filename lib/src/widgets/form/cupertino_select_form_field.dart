import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CupertinoSelectFormField extends StatefulWidget {
  final String name;
  final List<String> selectItems;
  final String? initialValue;
  final bool? bordered;
  const CupertinoSelectFormField({
    Key? key,
    required this.name,
    required this.selectItems,
    this.initialValue,
    this.bordered = true,
  }) : super(key: key);

  @override
  _CupertinoSelectFormFieldState createState() =>
      _CupertinoSelectFormFieldState();
}

class _CupertinoSelectFormFieldState extends State<CupertinoSelectFormField> {
  late int _currentIndex;
  final _focusNode = FocusNode(canRequestFocus: true);

  static const _emptyBorder = const UnderlineInputBorder(
    borderSide: BorderSide(width: 0, color: Colors.transparent),
  );

  bool isFocused = false;

  @override
  void initState() {
    _currentIndex = widget.initialValue == null
        ? 0
        : widget.selectItems.indexOf(widget.initialValue!);
    super.initState();
  }

  void openPicker(BuildContext context, FormFieldState<String> field) async {
    setState(() {
      _focusNode.requestFocus();
    });
    await showCupertinoModalPopup<String>(
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

    setState(() {
      _focusNode.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      builder: (field) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => openPicker(context, field),
        child: Row(
          children: [
            Expanded(
              child: Focus(
                focusNode: _focusNode,
                child: InputDecorator(
                  isEmpty: field.value != null,
                  isFocused: _focusNode.hasFocus,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 35,
                    ),
                    border: widget.bordered!
                        ? Theme.of(context).inputDecorationTheme.border
                        : _emptyBorder,
                    enabledBorder: widget.bordered!
                        ? Theme.of(context).inputDecorationTheme.enabledBorder
                        : _emptyBorder,
                    focusedBorder: widget.bordered!
                        ? Theme.of(context).inputDecorationTheme.focusedBorder
                        : _emptyBorder,
                    disabledBorder: widget.bordered!
                        ? Theme.of(context).inputDecorationTheme.disabledBorder
                        : _emptyBorder,
                    errorBorder: widget.bordered!
                        ? Theme.of(context).inputDecorationTheme.errorBorder
                        : _emptyBorder,
                    focusedErrorBorder: widget.bordered!
                        ? Theme.of(context)
                            .inputDecorationTheme
                            .focusedErrorBorder
                        : _emptyBorder,
                    errorText: field.errorText,
                  ),
                  child: Text(
                    field.value ?? '',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
