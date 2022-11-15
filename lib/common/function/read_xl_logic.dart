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
  print("rowlength:${excel.tables["Worksheet"]!.rows.length}");
  hiveBox.box.clear();
  int index = 0;
  for (var row in excel.tables["Worksheet"]!.rows) {
    print("start kanji");
    // var row = excel.tables["Worksheet"]!.rows[i];

    var vocabulary = XlKanjiHiveModel();
    vocabulary.level = loginState.hiveInfo.jlptLevel;
    vocabulary.kanji = getCellValue(row[0]);
    vocabulary.onReading = getCellValue(row[1]);
    vocabulary.kunReading = getCellValue(row[2]);
    vocabulary.meaningMn = getCellValue(row[3]);
    vocabulary.meaningEn = getCellValue(row[4]);
    vocabulary.example1 = getCellValue(row[5]);
    vocabulary.example1Mn = getCellValue(row[6]);
    vocabulary.example1En = getCellValue(row[7]);
    vocabulary.example2 = getCellValue(row[8]);
    vocabulary.example2Mn = getCellValue(row[9]);
    vocabulary.example2En = getCellValue(row[10]);
    vocabulary.example3 = getCellValue(row[11]);
    vocabulary.example3Mn = getCellValue(row[12]);
    vocabulary.example3En = getCellValue(row[13]);
    // vocabulary.example4 = getCellValue(row[14]);
    // vocabulary.example4Mn = getCellValue(row[15]);
    // vocabulary.example4En = getCellValue(row[16]);
    // vocabulary.example5 = getCellValue(row[17]);
    // vocabulary.example5Mn = getCellValue(row[18]);
    // vocabulary.example5En = getCellValue(row[19]);
    // ..level = loginState.hiveInfo.jlptLevel
    // ..kanji = getCellValue(row[0])
    // ..onReading = getCellValue(row[1])
    // ..kunReading = getCellValue(row[2])
    // ..meaningMn = getCellValue(row[3])
    // ..meaningEn = getCellValue(row[4])
    // ..example1 = getCellValue(row[5])
    // ..example1Mn = getCellValue(row[6])
    // ..example1En = getCellValue(row[7])
    // ..example2 = getCellValue(row[8])
    // ..example2Mn = getCellValue(row[9])
    // ..example2En = getCellValue(row[10])
    // ..example3 = getCellValue(row[11])
    // ..example3Mn = getCellValue(row[12])
    // ..example3En = getCellValue(row[13])
    // ..example4 = getCellValue(row[14])
    // ..example4Mn = getCellValue(row[15])
    // ..example4En = getCellValue(row[16])
    // ..example5 = getCellValue(row[17])
    // ..example5Mn = getCellValue(row[18])
    // ..example5En = getCellValue(row[19]);
    print("model");
    print("${vocabulary.kanji}");
    print("${vocabulary.meaningMn}");
    print("${vocabulary.onReading}");
    print("${vocabulary.kunReading}");
    // lstData.add(vocabulary);
    await hiveBox.box.put(index++, vocabulary);
  }
  print("ent kanjixl");
  // await hiveBox.box.put(excelDBName, lstData);
  for (var item in hiveBox.box.values) {
    print("row kanjixl");
    print("${item.kanji}");
    print("${item.meaningMn}");
    print("${item.onReading}");
    print("${item.kunReading}");
  }
  return lstData;
}

getCellValue(Data? row) {
  String value = "";
  try {
    value = row == null ? "" : row.value ?? "";
  } catch (ex) {
    print("cellError");
  }

  return value;
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
