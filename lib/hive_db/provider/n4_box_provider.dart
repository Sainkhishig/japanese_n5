import 'package:hishig_erdem/common/common_constant.dart';
import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n4BoxDataProvider = Provider<N4Box>((ref) => throw UnimplementedError());

class N4Box extends HiveBoxClass {
  N4Box(Box box) : super(box) {}
  List get lstKanji => box.get(lstHiveInfo[3].kanjiHive) ?? [];
  List get lstGrammar => box.get(lstHiveInfo[3].grammarHive) ?? [];
  List get lstVocabulary => box.get(lstHiveInfo[3].vocabularyHive) ?? [];
}
