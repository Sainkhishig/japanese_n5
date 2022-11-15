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
  print("readKanji:hello");
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.kanjiHive;
  print("readKanjiexcelDBName:$excelDBName");
  print("jlptLevel:${loginState.hiveInfo.jlptLevel}");

  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  print("readKanji:$excelDBName");
  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();
    var hiragana = row[2];

    var vocabulary = XlKanjiHiveModel()
      ..level = 5
      ..kanji = hiragana == null ? "" : hiragana.value
      ..onReading = kanji == null ? "" : kanji.value
      ..kunReading = translate == null ? "" : translate.value
      ..meaningMn = ""
      ..meaningEn = ""
      ..example1 = "example1"
      ..example1Mn = "example1Mn"
      ..example1En = "example1En"
      ..example2 = "example2"
      ..example2Mn = "example2Mn"
      ..example2En = "example2En"
      ..example3 = "example3"
      ..example3Mn = "example3Mn"
      ..example3En = "example3En"
      ..example4 = "example4"
      ..example4Mn = "example4Mn"
      ..example4En = "example4En"
      ..example5 = "example5"
      ..example5Mn = "example5Mn"
      ..example5En = "example5En";

    lstData.add(vocabulary);
  }

  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlGrammarHiveModel>> readGrammar(
    StateNotifierProviderRef ref) async {
  var loginState = ref.read(loginStateNotifierProvider);
  var excelDBName = loginState.hiveInfo.grammarHive;
  N5Box hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  var lstKanji = hiveBox.box.get("$excelDBName") as List<XlKanjiHiveModel>;
  if (lstKanji.isNotEmpty) {
    print("readKanji:$excelDBName");
    return [];
  }
  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  List<XlGrammarHiveModel> lstData = [];
  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();
    var hiragana = row[2];

    var vocabulary = XlGrammarHiveModel()
      ..level = 5
      ..grammar = hiragana == null ? "" : hiragana.value
      ..formMn = kanji == null ? "" : kanji.value
      ..formEn = translate == null ? "" : translate.value
      ..meaningMn = ""
      ..meaningEn = ""
      ..example1 = "example1"
      ..example1Mn = "example1Mn"
      ..example1En = "example1En"
      ..example2 = "example2"
      ..example2Mn = "example2Mn"
      ..example2En = "example2En"
      ..example3 = "example3"
      ..example3Mn = "example3Mn"
      ..example3En = "example3En"
      ..example4 = "example4"
      ..example4Mn = "example4Mn"
      ..example4En = "example4En"
      ..example5 = "example5"
      ..example5Mn = "example5Mn"
      ..example5En = "example5En";

    lstData.add(vocabulary);
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
  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
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
