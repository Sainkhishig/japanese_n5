import 'package:afen_vocabulary/hive_db/boxes/hive_box_class.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n5BoxDataProvider = Provider<N5Box>((ref) => throw UnimplementedError());

class N5Box extends HiveBoxClass {
  N5Box(Box box) : super(box) {
    // var person = Dictionary()
    //   ..level = 5
    //   ..word = "くるま"
    //   ..kanji = "車"
    //   ..translate = "машин"
    //   ..example = "くるまをうんてんするのがすき。"
    //   ..exampleTr = "Жолоо барих дуртай.";
    // var person2 = Dictionary()
    //   ..level = 5
    //   ..word = "たまご"
    //   ..kanji = "卵"
    //   ..translate = "ӨНДӨГ"
    //   ..example = "たまごはれいぞこにあります。"
    //   ..exampleTr = "Өндөг хөргөгчинд байгаа.";
    // box.add(person);
    // box.add(person2);

    // box.put("n5", Vocabulary(5, "くるま", "машин", "車", "くるまをうんてんするのがすき。"));
    // box.put("n5", Vocabulary(5, "りんご", "алим", "", "りんごをたべたい。"));

    // if (!box.containsKey("branchMaster")) {
    //   box.put("branchMaster", []);
    // }
  }
// lstCsvDBName = <CsvInfo>[
//   CsvInfo("Бүх", "wordN5", "N5Words"),
//   CsvInfo("Тэмдэг нэр", "adjectives", "N5Adjective"),
//   CsvInfo("Үйлт нэр", "csvadverb", "N5Adverb"),
//   CsvInfo("Холбоос үг", "csvparticle", "N5Particle"),
// ];
  dynamic get lstN5VocAll => box.get("wordN5");
  dynamic get lstN5VocAdjective => box.get("adjectives");

  dynamic get lstN5VocAdverb => box.get("csvadverb");
  dynamic get lstN5VocParticle => box.get("csvparticle");
}
