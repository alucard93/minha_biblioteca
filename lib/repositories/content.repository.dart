import 'package:hive_flutter/hive_flutter.dart';

class ContentRepository {
  final Box<List> _contentsBox;

  ContentRepository({required this._contentsBox});
}