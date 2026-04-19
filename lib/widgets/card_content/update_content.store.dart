import 'package:get_it/get_it.dart';
import 'package:minha_biblioteca/repositories/content.repository.dart';
import 'package:mobx/mobx.dart';
part 'update_content.store.g.dart';

class UpdateContentStore = _UpdateContentStoreBase with _$UpdateContentStore;

abstract class _UpdateContentStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isChecked = false;

  @action
  void setIsChecked(bool value) {
    isChecked = value;
  }

  @action
  Future<void> updateIsChecked({
    required String categoryId,
    required String contentId,
  }) async {
    isLoading = true;
    try {
      final newIsChecked = !isChecked;
      final repository = GetIt.I.get<ContentRepository>();

      await repository.updateContent(
        categoryId: categoryId,
        contentId: contentId,
        isChecked: newIsChecked,
      );

      isChecked = newIsChecked;
    } finally {
      isLoading = false;
    }
  }
}
