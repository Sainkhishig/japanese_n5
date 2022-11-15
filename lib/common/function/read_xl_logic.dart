import 'package:excel/excel.dart';
import 'package:hishig_erdem/common/hive_model/grammar/xl_grammar_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/common/hive_model/voabulary/xl_vocabulary_hive_model.dart';
import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';
import 'package:hishig_erdem/hive_db/provider/n1_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n2_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n3_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n4_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';

Future<List<XlKanjiHiveModel>> readKanji(StateNotifierProviderRef ref) async {
  List<XlKanjiHiveModel> lstData = [];

  var loginState = ref.read(loginStateNotifierProvider);
  var excelDBName = loginState.hiveInfo.kanjiHive;
  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  print("readKanji:$excelDBName");
  ByteData data = await rootBundle.load("assets/xl/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();
    var hiragana = row[2];

    // var vocabulary = XlKanjiBox()
    // ..level = 5
    // ..word = hiragana == null ? "" : hiragana.value
    // ..kanji = kanji == null ? "" : kanji.value
    // ..translate = translate == null ? "" : translate.value
    // ..example = ""
    // ..exampleTr = ""
    // ..wordType = "particle";
    // lstData.add(vocabulary);
  }

  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlGrammarHiveModel>> readGrammar(
    StateNotifierProviderRef ref) async {
  List<XlGrammarHiveModel> lstData = [];
  var loginState = ref.read(loginStateNotifierProvider);
  var excelDBName = loginState.hiveInfo.grammarHive;
  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  print("readKanji:$excelDBName");
  ByteData data = await rootBundle.load("assets/xl/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();
    var hiragana = row[2];

    // var vocabulary = XlKanjiBox()
    // ..level = 5
    // ..word = hiragana == null ? "" : hiragana.value
    // ..kanji = kanji == null ? "" : kanji.value
    // ..translate = translate == null ? "" : translate.value
    // ..example = ""
    // ..exampleTr = ""
    // ..wordType = "particle";
    // lstData.add(vocabulary);
  }

  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlVocabularyHiveModel>> readVocabulary(
    StateNotifierProviderRef ref) async {
  List<XlVocabularyHiveModel> lstData = [];

  var loginState = ref.read(loginStateNotifierProvider);
  var excelDBName = loginState.hiveInfo.vocabularyHive;
  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  print("readKanji:$excelDBName");
  ByteData data = await rootBundle.load("assets/xl/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();
    var hiragana = row[2];

    // var vocabulary = XlKanjiBox()
    // ..level = 5
    // ..word = hiragana == null ? "" : hiragana.value
    // ..kanji = kanji == null ? "" : kanji.value
    // ..translate = translate == null ? "" : translate.value
    // ..example = ""
    // ..exampleTr = ""
    // ..wordType = "particle";
    // lstData.add(vocabulary);
  }

  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

getJlptBoxByLevel(StateNotifierProviderRef ref, int level) {
  HiveBoxClass hiveBox;
  switch (level) {
    case 5:
      hiveBox = ref.read(n5BoxDataProvider);
      break;
    case 4:
      hiveBox = ref.read(n4BoxDataProvider);
      break;
    case 3:
      hiveBox = ref.read(n3BoxDataProvider);
      break;
    case 2:
      hiveBox = ref.read(n2BoxDataProvider);
      break;
    case 1:
      hiveBox = ref.read(n1BoxDataProvider);
      break;

    default:
      hiveBox = ref.read(n5BoxDataProvider);
      break;
  }
  return hiveBox;
}
