import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final xlKanjiBoxDataProvider =
    Provider<XlKanjiBox>((ref) => throw UnimplementedError());

class XlKanjiBox extends HiveBoxClass {
  XlKanjiBox(Box box) : super(box) {}
  dynamic get lstN5VocAll => box.get("wordN5");
  dynamic get lstN5VocAdjective => box.get("adjectives");

  dynamic get lstN5VocAdverb => box.get("csvadverb");
  dynamic get lstN5VocParticle => box.get("csvparticle");
}
