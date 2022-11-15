import 'package:hive_flutter/hive_flutter.dart';
part 'xl_grammar_hive_model.g.dart';

// grammar	usage	Япон	examples
@HiveType(typeId: 2)
class XlGrammarHiveModel extends HiveObject {
  @HiveField(0)
  late int level;
  @HiveField(1)
  late String grammar;
  @HiveField(2)
  late String formMn;
  @HiveField(3)
  late String formEn;
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
  late String example4;
  @HiveField(10)
  late String example5;
  @HiveField(11)
  late String example1Mn;
  @HiveField(12)
  late String example2Mn;
  @HiveField(13)
  late String example3Mn;
  @HiveField(14)
  late String example4Mn;
  @HiveField(15)
  late String example5Mn;
  @HiveField(16)
  late String example1En;
  @HiveField(17)
  late String example2En;
  @HiveField(18)
  late String example3En;
  @HiveField(19)
  late String example4En;
  @HiveField(20)
  late String example5En;
}
