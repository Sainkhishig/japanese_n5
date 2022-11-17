import 'package:hishig_erdem/common/common_constant.dart';
import 'package:hishig_erdem/common/hive_model/grammar/xl_grammar_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/voabulary/xl_vocabulary_hive_model.dart';
import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n2BoxDataProvider = Provider<N2Box>((ref) => throw UnimplementedError());

class N2Box extends HiveBoxClass {
  N2Box(Box box) : super(box);
  List get lstKanji => box.get(lstHiveInfo[1].kanjiHive);

  List get lstGrammar => box.get(lstHiveInfo[1].grammarHive);
  List get lstVocabulary => box.get(lstHiveInfo[1].vocabularyHive);
}
