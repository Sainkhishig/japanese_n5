import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n4BoxDataProvider = Provider<N4Box>((ref) => throw UnimplementedError());

class N4Box extends HiveBoxClass {
  N4Box(Box box) : super(box) {}
  dynamic get lstN4VocAll => box.get("vocabularyN4");
  dynamic get lstN4VocAdjective => box.get("adjectives");
  dynamic get lstN4VocAdverb => box.get("csvadverb");
  dynamic get lstN4VocParticle => box.get("csvparticle");
}
