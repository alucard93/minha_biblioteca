import 'package:get_it/get_it.dart';
import 'package:minha_biblioteca/model/content.model.dart';
import 'package:minha_biblioteca/repositories/content.repository.dart';
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

    final repository = GetIt.I.get<ContentRepository>();
    final contentsTemp = await repository.getAllContents(categoryId);
    contents = contentsTemp.asObservable();

    isLoading = false;
  }

  @action
  Future<void> addNewContent({
    required String contentName,
    required String categoryId,
  }) async {
    final repository = GetIt.I.get<ContentRepository>();
    final content = Content(
      id: DateTime.now().millisecond.toString(),
      name: contentName,
    );

    await repository.addNewContent(categoryId: categoryId, content: content);
    contents.add(content);
  }
}
