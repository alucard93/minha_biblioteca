import 'dart:io';

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
}
