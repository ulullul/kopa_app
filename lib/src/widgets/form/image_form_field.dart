import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/resources/icons.dart';
import 'package:flutter_app_example/src/utils/custom_icon.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormField extends StatefulWidget {
  const ImageFormField({Key? key}) : super(key: key);

  @override
  _ImageFormFieldState createState() => _ImageFormFieldState();
}

class _ImageFormFieldState extends State<ImageFormField> {
  final _picker = ImagePicker();

  Future<void> _selectPhoto(FormFieldState<List<XFile>> field) async {
    final res = await _picker.pickImage(source: ImageSource.camera);
    field.didChange([...?field.value, res!]);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 165),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: FormBuilderField<List<XFile>>(
          name: 'asd',
          builder: (field) {
            return GestureDetector(
              onTap: () => _selectPhoto(field),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, index) {
                  if (index == 0 &&
                      (field.value == null || (field.value?.isEmpty ?? true))) {
                    return _firstEmptyItem();
                  }
                  if ((field.value?.length ?? 0) > index &&
                      field.value?.elementAt(index) != null) {
                    return _imageItem(
                      field.value!.elementAt(index),
                    );
                  }
                  // if (field.value == null || (field.value?.isEmpty ?? true))
                  return _emptyItem();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _imageItem(XFile image) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(image.path),
          ),
        ),
        color: const Color(0xffe5e5ea),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }

  Widget _emptyItem() {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: const Color(0xffe5e5ea),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }

  Widget _firstEmptyItem() {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor /*const Color(0xffe5e5ea)*/,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: CustomIcon(
          AppIcons.camera,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
