import 'package:flutter/material.dart';
import 'package:minha_biblioteca/colors.dart';

import 'package:minha_biblioteca/model/category.model.dart';

class ContentsPage extends StatelessWidget {
  final Category category;
  const ContentsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo a sua biblioteca"),
        backgroundColor: primaryColor,
      ),
      body: const Center(child: Text('Conteúdos da categoria')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
