import 'package:flutter/material.dart';
import 'package:minha_biblioteca/colors.dart';
import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/widgets/card_category/card_category.widget.dart';
import 'package:minha_biblioteca/widgets/new_category/new_category.widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void newCategory(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (ctx) {
        return const NewCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Minha Biblioteca'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Escolha uma das categorias',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                children: [
                  CardCategory(
                    category: Category(
                      id: "1",
                      name: "Filmes",
                      filePath: "assets/bg-filmes.jpg",
                    ),
                  ),
                  CardCategory(
                    category: Category(id: "2", name: "Series"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => newCategory(context),
        backgroundColor: primaryColor.withValues(alpha: 0.8),
        label: const Text("+ Categoria"),
      ),
    );
  }
}
