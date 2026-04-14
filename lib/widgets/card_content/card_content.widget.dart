import 'package:flutter/material.dart';
import 'package:minha_biblioteca/colors.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 10,
      shadowColor: primaryColor,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor.withValues(alpha: 0.8),
              secondaryColor.withValues(alpha: 0.4),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Homem de ferro"),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                foregroundColor: primaryColor,
              ),
              onPressed: () {},
              child: Icon(Icons.visibility, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
