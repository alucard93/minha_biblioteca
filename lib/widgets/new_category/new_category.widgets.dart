import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minha_biblioteca/colors.dart';
import 'package:minha_biblioteca/widgets/new_category/add_category.store.dart';
import 'package:minha_biblioteca/widgets/new_category/image_viewer.widget.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final store = AddCategoryStore();

  void addCategory() async {
    if (!formKey.currentState!.validate()) return;
    if (store.isLoading) return;

    await store.addCategory(nameController.text);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Nova Categoria",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                      color: secondaryColor,
                    ),
                  ],
                ),
                const Divider(thickness: 1, height: 0),

                const SizedBox(height: 15),

                TextFormField(
                  controller: nameController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Nome da categoria'),
                    labelStyle: TextStyle(color: primaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Obrigatório";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                Text(
                  "Escolha uma imagem para deixar mais visivel a categoria",
                  style: TextStyle(color: secondaryColor),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: ImageViewer(store: store),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                        primaryColor.withValues(alpha: 0.1),
                      ),
                    ),
                    onPressed: addCategory,
                    child: Observer(
                      builder: (context) {
                        return store.isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Adicionar",
                                style: TextStyle(color: Colors.blue),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
