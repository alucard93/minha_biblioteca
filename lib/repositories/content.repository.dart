import 'package:hive_flutter/hive_flutter.dart';

class ContentRepository {
  final Box<List> _boxContents;

  ContentRepository({required Box<List> boxContents})
    : _boxContents = boxContents;
}
