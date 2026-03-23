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
            child: Center(child: Text(category.name)),
          ),
        ),
      ),
    );
  }
}
