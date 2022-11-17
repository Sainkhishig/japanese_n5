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

Future<List<XlKanjiHiveModel>> readXlKanji(WidgetRef ref) async {
  List<XlKanjiHiveModel> lstData = [];
  print("readKanji:hello");
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.kanjiHive;
  print("readKanjiexcelDBName:$excelDBName");
  print("jlptLevel:${loginState.hiveInfo.jlptLevel}");

  var hiveBox = getJlptHiveByLevel(ref, loginState.hiveInfo.jlptLevel);

  var db = hiveBox.lstKanji;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  print("rowlength:${excel.tables["Worksheet"]!.rows.length}");
  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    print("start kanji");
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();

    var vocabulary = XlKanjiHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..kanji = getCellValue(row[0])
      ..onReading = getCellValue(row[1])
      ..kunReading = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7])
      ..example2 = getCellValue(row[8])
      ..example2Mn = getCellValue(row[9])
      ..example2En = getCellValue(row[10])
      ..example3 = getCellValue(row[11])
      ..example3Mn = getCellValue(row[12])
      ..example3En = getCellValue(row[13])
      ..example4 = getCellValue(row[14])
      ..example4Mn = getCellValue(row[15])
      ..example4En = getCellValue(row[16]);
    // ..example5 = getCellValue(row[17])
    // ..example5Mn = getCellValue(row[18])
    // ..example5En = getCellValue(row[19]);

    lstData.add(vocabulary);
  }
  print("ent kanjixl");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlKanjiHiveModel>> readKanji(StateNotifierProviderRef ref) async {
  List<XlKanjiHiveModel> lstData = [];
  print("readKanji:hello");
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.kanjiHive;
  print("readKanjiexcelDBName:$excelDBName");
  print("jlptLevel:${loginState.hiveInfo.jlptLevel}");

  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);

  var db = hiveBox.lstKanji;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  print("rowlength:${excel.tables["Worksheet"]!.rows.length}");
  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    print("start kanji");
    var row = excel.tables["Worksheet"]!.rows[i];
    var kanji = row[0];
    var translate = row[1]; //!.value.toString();

    var vocabulary = XlKanjiHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..kanji = getCellValue(row[0])
      ..onReading = getCellValue(row[1])
      ..kunReading = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7])
      ..example2 = getCellValue(row[8])
      ..example2Mn = getCellValue(row[9])
      ..example2En = getCellValue(row[10])
      ..example3 = getCellValue(row[11])
      ..example3Mn = getCellValue(row[12])
      ..example3En = getCellValue(row[13])
      ..example4 = getCellValue(row[14])
      ..example4Mn = getCellValue(row[15])
      ..example4En = getCellValue(row[16]);
    // ..example5 = getCellValue(row[17])
    // ..example5Mn = getCellValue(row[18])
    // ..example5En = getCellValue(row[19]);

    lstData.add(vocabulary);
  }
  print("ent kanjixl");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

getCellValue(Data? row) {
  return row == null
      ? ""
      : row.value == null
          ? ""
          : "${row.value}";
}

Future<List<XlGrammarHiveModel>> readGrammar(
    StateNotifierProviderRef ref) async {
  List<XlGrammarHiveModel> lstData = [];
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.grammarHive;

  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);

  var db = hiveBox.lstGrammar;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];

    var vocabulary = XlGrammarHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..grammar = getCellValue(row[0])
      ..formMn = getCellValue(row[1])
      ..formEn = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7])
      ..example2 = getCellValue(row[8])
      ..example2Mn = getCellValue(row[9])
      ..example2En = getCellValue(row[10])
      ..example3 = getCellValue(row[11])
      ..example3Mn = getCellValue(row[12])
      ..example3En = getCellValue(row[13]);
    // ..example4 = getCellValue(row[14])
    // ..example4Mn = getCellValue(row[15])
    // ..example4En = getCellValue(row[16])
    // ..example5 = ""
    // ..example5Mn = ""
    // ..example5En = "";

    lstData.add(vocabulary);
  }
  print("end Gramar");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlVocabularyHiveModel>> readVocabulary(
    StateNotifierProviderRef ref) async {
  List<XlVocabularyHiveModel> lstData = [];
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.vocabularyHive;

  var hiveBox = getJlptBoxByLevel(ref, loginState.hiveInfo.jlptLevel);
  var db = hiveBox.lstVocabulary;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];

    var vocabulary = XlVocabularyHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..kanji = getCellValue(row[0])
      ..kana = getCellValue(row[1])
      ..wordType = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7]);
    // ..example2 = getCellValue(row[8])
    // ..example2Mn = getCellValue(row[9])
    // ..example2En = getCellValue(row[10])
    // ..example3 = getCellValue(row[11])
    // ..example3Mn = getCellValue(row[12])
    // ..example3En = getCellValue(row[13]);
    // ..example4 = getCellValue(row[14])
    // ..example4Mn = getCellValue(row[15])
    // ..example4En = getCellValue(row[16])
    // ..example5 = ""
    // ..example5Mn = ""
    // ..example5En = "";

    lstData.add(vocabulary);
  }
  print("end Vocabulary");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlGrammarHiveModel>> readXlGrammar(WidgetRef ref) async {
  List<XlGrammarHiveModel> lstData = [];
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.grammarHive;

  var hiveBox = getJlptHiveByLevel(ref, loginState.hiveInfo.jlptLevel);

  var db = hiveBox.lstGrammar;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];

    var vocabulary = XlGrammarHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..grammar = getCellValue(row[0])
      ..formMn = getCellValue(row[1])
      ..formEn = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7])
      ..example2 = getCellValue(row[8])
      ..example2Mn = getCellValue(row[9])
      ..example2En = getCellValue(row[10])
      ..example3 = getCellValue(row[11])
      ..example3Mn = getCellValue(row[12])
      ..example3En = getCellValue(row[13]);
    // ..example4 = getCellValue(row[14])
    // ..example4Mn = getCellValue(row[15])
    // ..example4En = getCellValue(row[16])
    // ..example5 = ""
    // ..example5Mn = ""
    // ..example5En = "";

    lstData.add(vocabulary);
  }
  print("end Gramar");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

Future<List<XlVocabularyHiveModel>> readXlVocabulary(WidgetRef ref) async {
  List<XlVocabularyHiveModel> lstData = [];
  LoginState loginState = ref.read(loginStateNotifierProvider.notifier);
  var excelDBName = loginState.hiveInfo.vocabularyHive;

  var hiveBox = getJlptHiveByLevel(ref, loginState.hiveInfo.jlptLevel);
  var db = hiveBox.lstVocabulary;
  if (db != null && db.isNotEmpty) {
    print("$excelDBName exist");
    return db;
  }

  ByteData data = await rootBundle.load("assets/xl/all/$excelDBName.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  for (var i = 1; i < excel.tables["Worksheet"]!.rows.length; i++) {
    var row = excel.tables["Worksheet"]!.rows[i];

    var vocabulary = XlVocabularyHiveModel()
      ..level = loginState.hiveInfo.jlptLevel
      ..kanji = getCellValue(row[0])
      ..kana = getCellValue(row[1])
      ..wordType = getCellValue(row[2])
      ..meaningMn = getCellValue(row[3])
      ..meaningEn = getCellValue(row[4])
      ..example1 = getCellValue(row[5])
      ..example1Mn = getCellValue(row[6])
      ..example1En = getCellValue(row[7]);
    // ..example2 = getCellValue(row[8])
    // ..example2Mn = getCellValue(row[9])
    // ..example2En = getCellValue(row[10])
    // ..example3 = getCellValue(row[11])
    // ..example3Mn = getCellValue(row[12])
    // ..example3En = getCellValue(row[13]);
    // ..example4 = getCellValue(row[14])
    // ..example4Mn = getCellValue(row[15])
    // ..example4En = getCellValue(row[16])
    // ..example5 = ""
    // ..example5Mn = ""
    // ..example5En = "";

    lstData.add(vocabulary);
  }
  print("end Vocabulary");
  await hiveBox.box.put(excelDBName, lstData);

  return lstData;
}

dynamic getJlptHiveByLevel(WidgetRef ref, int level) {
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

dynamic getJlptBoxByLevel(StateNotifierProviderRef ref, int level) {
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
