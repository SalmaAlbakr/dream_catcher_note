import 'package:hive/hive.dart';

part 'model_class.g.dart';

@HiveType(typeId: 1)
class ModelClass {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;

  ModelClass({
    required this.name,
    required this.age,
  });
}
