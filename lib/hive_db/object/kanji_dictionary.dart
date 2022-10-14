import 'package:hive_flutter/hive_flutter.dart';
part 'kanji_dictionary.g.dart';

@HiveType(typeId: 1)
class KanjiDictionary extends HiveObject {
  @HiveField(0)
  late int level;
  @HiveField(1)
  late String kanji;
  @HiveField(2)
  late String translate;
  @HiveField(3)
  late String onReading;
  @HiveField(4)
  late String kunReading;
  @HiveField(5)
  late String example;
  @HiveField(6)
  String exampleTr = "";
  @HiveField(7)
  late String exampleReading;
}
