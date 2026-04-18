import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:minha_biblioteca/colors.dart';

import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/pages/contents/contents.store.dart';
import 'package:minha_biblioteca/widgets/add_content/add_content.widget.dart';
import 'package:minha_biblioteca/widgets/card_content/card_content.widget.dart';

class ContentsPage extends StatelessWidget {
  final Category category;
  final store = ContentsStore();
  ContentsPage({super.key, required this.category}) {
    store.getContents(category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo a sua biblioteca"),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Conteúdos da categoria: ${category.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Observer(
                builder: (context) {
                  return store.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: store.contents.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (direction) async {
                                return true;
                              },
                              background: Center(
                                child: Container(
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
                              child: CardContent(
                                content: store.contents[index],
                              ),
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
        onPressed: () async {
          final contentName = await showDialog(
            context: context,
            builder: (context) {
              return AddContent();
            },
          );
          if (contentName != null) {
            store.addNewContent(
              contentName: contentName,
              categoryId: category.id,
            );
          }
        },
        backgroundColor: primaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Conteúdo',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
