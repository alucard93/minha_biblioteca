import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/pages/home.page.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
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
