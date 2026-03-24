import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minha_biblioteca/colors.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  final imagePicker = ImagePicker();

  File? file;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final image = await imagePicker.pickImage(source: ImageSource.gallery);

        setState(() {
          if (image != null) {
            file = File(image.path);
          }
        });
      },
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: secondaryColor)),
        child: Icon(Icons.image, color: primaryColor, size: 50),
      ),
    );
  }
}
