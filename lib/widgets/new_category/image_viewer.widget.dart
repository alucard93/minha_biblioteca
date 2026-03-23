import 'package:flutter/material.dart';
import 'package:minha_biblioteca/colors.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: secondaryColor)),
        child: Icon(Icons.image, color: primaryColor, size: 50),
      ),
    );
  }
}
