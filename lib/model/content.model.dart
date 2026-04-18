import 'package:hive/hive.dart';

part 'content.model.g.dart';

@HiveType(typeId: 2)
class Content {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isChecked;

  Content({required this.id, required this.name, this.isChecked = false});
}
