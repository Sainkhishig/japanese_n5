import 'package:hive_flutter/hive_flutter.dart';
part 'xl_kanji_box.g.dart';

// Kanji	Kana	POS	Утга	Meaning	Example	Жишээ
@HiveType(typeId: 2)
class XlKanjiBox extends HiveObject {
  @HiveField(0)
  late int level;
  @HiveField(1)
  late String kanji;
  @HiveField(2)
  late String onReading;
  @HiveField(3)
  late String kunReading;
  @HiveField(4)
  late String meaningMn;
  @HiveField(5)
  late String meaningEn;
  @HiveField(6)
  late String example1;
  @HiveField(7)
  late String example2;
  @HiveField(8)
  late String example3;
  @HiveField(9)
  late String example1Mn;
  @HiveField(10)
  late String example2Mn;
  @HiveField(11)
  late String example3Mn;
  @HiveField(12)
  late String example1En;
  @HiveField(13)
  late String example2En;
  @HiveField(14)
  late String example3En;
}
