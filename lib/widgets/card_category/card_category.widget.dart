import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minha_biblioteca/colors.dart';
import 'package:minha_biblioteca/model/category.model.dart';

class CardCategory extends StatelessWidget {
  final Category category;
  const CardCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 10,
        shadowColor: primaryColor,
        child: Container(
          decoration: BoxDecoration(
            image: category.filePath != null
                ? DecorationImage(
                    image: FileImage(File(category.filePath!)),
                    fit: BoxFit.cover,
                    opacity: 0.6,
                  )
                : null,
            gradient: LinearGradient(
              colors: [
                primaryColor.withValues(alpha: 0.8),
                secondaryColor.withValues(alpha: 0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: InkWell(
            splashColor: secondaryColor.withValues(alpha: 0.6),
            onTap: () {},
            child: Center(
              child: Text(
                category.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
