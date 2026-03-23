import 'package:flutter/material.dart';
import 'package:minha_biblioteca/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem-vindo a sua biblioteca',
      home: const HomePage(),
    );
  }
}
