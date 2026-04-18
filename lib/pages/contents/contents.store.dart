import 'package:minha_biblioteca/model/content.model.dart';
import 'package:mobx/mobx.dart';
part 'contents.store.g.dart';

class ContentsStore = _ContentsStoreBase with _$ContentsStore;

abstract class _ContentsStoreBase with Store {
  @observable
  ObservableList<Content> contents = <Content>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> getContents(String categoryId) async {
    isLoading = true;
    isLoading = false;
  }
}
