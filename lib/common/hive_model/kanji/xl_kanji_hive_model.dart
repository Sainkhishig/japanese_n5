import 'package:hive_flutter/hive_flutter.dart';
part 'xl_kanji_hive_model.g.dart';

// Kanji	Kana	POS	Утга	Meaning	Example	Жишээ
@HiveType(typeId: 3)
class XlKanjiHiveModel extends HiveObject {
  @HiveField(0)
  late int level;
  @HiveField(1)
  late String kanji;
  @HiveField(2)
  late String onReading;
  @HiveField(3)
  late String kunReading;
  @HiveField(4)
  String meaningMn = "";
  @HiveField(5)
  String meaningEn = "";
  @HiveField(6)
  String example1 = "";
  @HiveField(7)
  String example2 = "";
  @HiveField(8)
  String example3 = "";
  @HiveField(9)
  String example4 = "";
  @HiveField(10)
  String example5 = "";
  @HiveField(11)
  String example1Mn = "";
  @HiveField(12)
  String example2Mn = "";
  @HiveField(13)
  String example3Mn = "";
  @HiveField(14)
  String example4Mn = "";
  @HiveField(15)
  String example5Mn = "";
  @HiveField(16)
  String example1En = "";
  @HiveField(17)
  String example2En = "";
  @HiveField(18)
  String example3En = "";
  @HiveField(19)
  String example4En = "";
  @HiveField(20)
  String example5En = "";
}
