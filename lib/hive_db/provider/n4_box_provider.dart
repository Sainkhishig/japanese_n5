import 'package:hishig_erdem/common/common_constant.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n4BoxDataProvider = Provider<N4Box>((ref) => throw UnimplementedError());

class N4Box extends HiveBoxClass {
  N4Box(Box box) : super(box) {}
  List<XlKanjiHiveModel> get lstN4Kanji => box.get(lstHiveInfo[3].kanjiHive);
  dynamic get lstN4Grammar => box.get(lstHiveInfo[3].grammarHive);
  dynamic get lstN4Vocabulary => box.get(lstHiveInfo[3].vocabularyHive);
}
