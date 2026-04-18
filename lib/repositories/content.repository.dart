import 'package:hive_flutter/hive_flutter.dart';
import 'package:minha_biblioteca/model/content.model.dart';

class ContentRepository {
  final Box<List> _boxContents;

  ContentRepository({required Box<List> boxContents})
    : _boxContents = boxContents;

  Future<List<Content>> getAllContents(String categoryId) async {
    await Future.delayed(const Duration(seconds: 1));
    final contents = _boxContents.get("contents:$categoryId", defaultValue: []);
    return List<Content>.from(contents!);
  }

  Future<void> addNewContent({required String categoryId, required Content content}) async {
    final contents = await getAllContents(categoryId);
    contents.add(content);
    await _boxContents.put("contents:$categoryId", contents);
    
  }
}
