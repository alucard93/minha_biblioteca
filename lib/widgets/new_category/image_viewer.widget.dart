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
        child: file == null
            ? Icon(Icons.image, color: primaryColor, size: 50)
            : Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.file(file!, fit: BoxFit.cover),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          file = null;
                        });
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
              ),
      ),
    );
  }
}
