import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minha_biblioteca/colors.dart';

import 'package:minha_biblioteca/pages/home/home.store.dart';
import 'package:minha_biblioteca/widgets/card_category/card_category.widget.dart';
import 'package:minha_biblioteca/widgets/new_category/new_category.widgets.dart';

class HomePage extends StatelessWidget {
  final store = HomeStore();

  HomePage({super.key}) {
    GetIt.I.allReady().then((_) => store.getCategories());
  }

  void newCategory(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (ctx) {
        return const NewCategory();
      },
    );

    store.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Minha Biblioteca'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
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
              child: Observer(
                builder: (context) {
                  return store.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: store.categories.length,
                          itemBuilder: (context, index) {
                            final category = store.categories[index];
                            return Dismissible(
                              key: ValueKey(category.id.toString()),
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (direction) async {
                                return store.removeCategory(category.id!);
                              },
                              background: Center(
                                child: Container(
                                  height: 114,
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: CardCategory(category: category),
                            );
                          },
                        );
                },
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
