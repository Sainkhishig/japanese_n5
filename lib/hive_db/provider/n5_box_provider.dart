import 'package:afen_vocabulary/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n5BoxDataProvider = Provider<N5Box>((ref) => throw UnimplementedError());

class N5Box extends HiveBoxClass {
  N5Box(Box box) : super(box) {}
  dynamic get lstN5VocAll => box.get("wordN5");
  dynamic get lstN5VocAdjective => box.get("adjectives");

  dynamic get lstN5VocAdverb => box.get("csvadverb");
  dynamic get lstN5VocParticle => box.get("csvparticle");
}
