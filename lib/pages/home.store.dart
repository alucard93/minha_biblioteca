import 'package:get_it/get_it.dart';
import 'package:minha_biblioteca/model/category.model.dart';
import 'package:minha_biblioteca/repositories/category.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<Category> categories = <Category>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> getCategories() async {
    isLoading = true;

    final repository = GetIt.I.get<CategoryRepository>();

    categories = (await repository.getAllCategories()).asObservable();
    isLoading = false;
  }
}
