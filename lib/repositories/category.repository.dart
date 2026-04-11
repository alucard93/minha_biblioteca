import 'package:hive_flutter/hive_flutter.dart';
import 'package:minha_biblioteca/model/category.model.dart';

class CategoryRepository {
  final Box<List> boxCategories;

  CategoryRepository(this.boxCategories);

  Future<void> addNewCategory(Category category) async {
    final categories = boxCategories.get('categories', defaultValue: [])!;
    categories.add(category);
    await boxCategories.put('categories', categories);
    await Future.delayed(const Duration(seconds: 2));
  }
}
