import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minha_biblioteca/colors.dart';
import 'package:minha_biblioteca/widgets/new_category/add_category.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImageViewer extends StatelessWidget {
  final AddCategoryStore store;
  ImageViewer({super.key, required this.store});

  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final image = await imagePicker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          store.setImage(File(image.path));
        }
      },
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: secondaryColor)),
        child: Observer(
          builder: (context) {
            return store.imageCategory == null
                ? Icon(Icons.image, color: primaryColor, size: 50)
                : Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.file(
                          store.imageCategory!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: () {
                            store.removeImage();
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
