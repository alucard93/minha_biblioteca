import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minha_biblioteca/colors.dart';
import 'package:minha_biblioteca/model/content.model.dart';
import 'package:minha_biblioteca/widgets/card_content/update_content.store.dart';

class CardContent extends StatelessWidget {
  final Content content;
  final String categoryId;
  final store = UpdateContentStore();

  CardContent({super.key, required this.content, required this.categoryId}) {
    store.setIsChecked(content.isChecked);
  }

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
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return store.isLoading
                    ? LinearProgressIndicator(color: Colors.white)
                    : SizedBox.shrink();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.name),
                Observer(
                  builder: (context) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        foregroundColor: primaryColor,
                      ),
                      onPressed: store.isLoading
                          ? null
                          : () {
                              store.updateIsChecked(
                                categoryId: categoryId,
                                contentId: content.id,
                              );
                            },
                      child: store.isChecked
                          ? Icon(Icons.visibility, color: Colors.green)
                          : Icon(Icons.visibility_off, color: Colors.red),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
