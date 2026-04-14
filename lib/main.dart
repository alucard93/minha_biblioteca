import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/pages/home/home.page.dart';
import 'package:minha_biblioteca/repositories/category.repository.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
}

void initServiceLocator() {
  GetIt.I.registerSingletonAsync<CategoryRepository>(() async {
    final box = await Hive.openBox<List>("categories");
    return CategoryRepository(boxCategories: box);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bem-vindo a sua biblioteca', home: HomePage());
  }
}
