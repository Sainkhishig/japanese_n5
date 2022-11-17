import 'package:hishig_erdem/common/common_constant.dart';
import 'package:hishig_erdem/common/hive_model/grammar/xl_grammar_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/voabulary/xl_vocabulary_hive_model.dart';
import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n5BoxDataProvider = Provider<N5Box>((ref) => throw UnimplementedError());

class N5Box extends HiveBoxClass {
  N5Box(Box box) : super(box) {}
  dynamic get lstN5VocAll => box.get("wordN5");
  dynamic get lstN5VocAdjective => box.get("adjectives");

  dynamic get lstN5VocAdverb => box.get("csvadverb");
  dynamic get lstN5VocParticle => box.get("csvparticle");
  List get lstKanji => box.get(lstHiveInfo[3].kanjiHive);

  List get lstGrammar => box.get(lstHiveInfo[3].grammarHive);
  List get lstVocabulary => box.get(lstHiveInfo[3].vocabularyHive);
}
