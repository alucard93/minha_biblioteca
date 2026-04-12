import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/repositories/category.repository.dart';
import 'package:mobx/mobx.dart';
part 'add_category.store.g.dart';

class AddCategoryStore = AddCategoryStoreBase with _$AddCategoryStore;

abstract class AddCategoryStoreBase with Store {
  @observable
  File? imageCategory;

  @observable
  bool isLoading = false;

  @action
  void setImage(File image) => imageCategory = image;

  @action
  void removeImage() => imageCategory = null;

  @action
  Future<void> addCategory(String nameCategory) async {
    isLoading = true;
    final repository = GetIt.I.get<CategoryRepository>();

    await repository.addNewCategory(
      Category(
        id: DateTime.now().millisecond.toString(),
        name: nameCategory,
        filePath: imageCategory?.path,
      ),
    );
    isLoading = false;
  }
}
