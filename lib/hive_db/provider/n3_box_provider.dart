import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n3BoxDataProvider = Provider<N3Box>((ref) => throw UnimplementedError());

class N3Box extends HiveBoxClass {
  N3Box(Box box) : super(box) {}
  dynamic get lstN3VocAll => box.get("vocabularyN3");
}
