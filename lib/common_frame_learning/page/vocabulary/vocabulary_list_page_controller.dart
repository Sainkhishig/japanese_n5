import 'package:afen_vocabulary/common_frame_learning/constant_value/common_constants.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider =
    StateNotifierProvider<VocabularyListPageController, VocabularyModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController extends StateNotifier<VocabularyModel> {
  VocabularyListPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocListProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSearchKey(String key) async {
    state = state.copyWith(searchKey: key);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

  Future<void> prepareVocabulary() async {
    // await loadWordN5();
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();

    var lstHiveData = [];
    // for (var csvInfo in lstCsvDBName) {
    //   lstHiveData.add(await loadAllXl(csvInfo));
    // }
    print("adj");
    lstHiveData.add(await loadAllXl("adjectives"));
    print("adv");
    lstHiveData.add(await loadAllXl("csvadverb"));
    print("particle");
    lstHiveData.add(await loadAllXl("csvparticle"));
    print("all");

    // lstHiveData.add(await loadAllXl("wordN5"));
    // await lstN5.box.put("vocabularyDB", lstHiveData);
  }

  Future<List<Dictionary>> loadAllXl(String xlName) async {
    print("loadWordN5");
    List<Dictionary> lstData = [];
    // var lstN5 = widgetRef.read(n5BoxDataProvider);
    // await lstN5.box.clear();
    ByteData data = await rootBundle.load("assets/xl/$xlName.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    switch (xlName) {
      case "adjectives":
        lstData = getAdjectiveInfo(excel.tables["Worksheet"]!.rows);
        break;
      case "csvadverb":
        lstData = getAdverbInfo(excel.tables["Worksheet"]!.rows);
        break;
      case "csvparticle":
        lstData = getParticleInfo(excel.tables["Worksheet"]!.rows);
        break;
      case "wordN5":
        lstData = getAllN5(excel.tables["Worksheet"]!.rows);
        break;
      default:
    }
    // print("loadWordN52");
    // for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
    //   var row = excel.tables["Worksheet"]!.rows[i];

    //   // print(row[0]);
    //   var voc = row[0];
    //   // print("loadWordN5");
    //   // print(voc!.value.toString());
    //   var vocMn = row[1]; //!.value.toString();
    //   var example = row[2];
    //   var exampleTr = row[4]!.value.toString();

    //   var vocabulary = Dictionary()
    //     ..level = 5
    //     ..word = voc!.value.toString()
    //     ..kanji = ""
    //     ..translate = vocMn!.value.toString()
    //     ..example = example!.value.toString()
    //     ..exampleTr = exampleTr
    //     ..wordType = "csv.csvName";
    //   if (!vocabulary.word.contains("null") &&
    //       !vocabulary.translate.contains("null")) lstData.add(vocabulary);
    // }

    // await lstN5.box.put("vocabularyDB", lstData);

    print("done");
    print(lstData.length);
    return lstData;
  }

  // Dictionary getKanjiInfo(row) {
  //   var kanji = row[0];
  //   var translate = row[1]; //!.value.toString();
  //   var onReading = row[2];
  //   var kunReading = row[3];
  //   var example = row[4];
  //   var exampleTr = row[5];
  //   var exampleReading = row[6];

  //   var kanjiDic = KanjiDictionary()
  //     ..level = 5
  //     ..kanji = kanji
  //     ..translate = translate
  //     ..onReading = onReading
  //     ..kunReading = kunReading
  //     ..example = example
  //     ..exampleTr = exampleTr
  //     ..exampleReading = exampleReading;
  //   return vocabulary;
  // }

  List<Dictionary> getAllN5(List rows) {
    List<Dictionary> lstData = [];
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      var voc = row[0];
      var vocMn = row[1]; //!.value.toString();
      var exampleTr = row[2];
      var example = row[4];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = voc!.value.toString()
        ..kanji = ""
        ..translate = vocMn!.value.toString()
        ..example = example!.value.toString()
        ..exampleTr = exampleTr
        ..wordType = "allVoc";
      lstData.add(vocabulary);
    }
    return lstData;
  }

  List<Dictionary> getAdverbInfo(List rows) {
    List<Dictionary> lstData = [];
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var hiragana = row[2];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = hiragana
        ..kanji = kanji
        ..translate = translate
        ..example = ""
        ..exampleTr = ""
        ..wordType = "adverb";
      lstData.add(vocabulary);
    }
    return lstData;
  }

  List<Dictionary> getAdjectiveInfo(List rows) {
    List<Dictionary> lstData = [];
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var hiragana = row[2];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = hiragana
        ..kanji = kanji
        ..translate = translate
        ..example = ""
        ..exampleTr = ""
        ..wordType = "adjective";
      lstData.add(vocabulary);
    }
    return lstData;
  }

  List<Dictionary> getParticleInfo(List rows) {
    List<Dictionary> lstData = [];
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var hiragana = row[2];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = hiragana
        ..kanji = kanji
        ..translate = translate
        ..example = ""
        ..exampleTr = ""
        ..wordType = "particle";
      lstData.add(vocabulary);
    }

    return lstData;
  }

  Future<List<Dictionary>> loadWordN5() async {
    print("loadWordN5");
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();
    ByteData data = await rootBundle.load("assets/xl/kanji.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    print("loadWordN52");
    for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
      var row = excel.tables["Worksheet"]!.rows[i];

      var voc = row[0];
      var vocMn = row[1]; //!.value.toString();
      var example = row[2];
      var exampleTr = row[4];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = voc == null ? "" : voc.value
        ..kanji = ""
        ..translate = vocMn == null ? "" : vocMn.value
        ..example = example == null ? "" : example.value
        ..exampleTr = exampleTr == null ? "" : exampleTr.value
        ..wordType = "csv.csvName";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("vocabularyDB", lstData);

    print("done");
    print(lstData.length);
    return lstData;
  }

  Future<List<Dictionary>> loadCSV(CsvInfo csv) async {
    List<Dictionary> lstData = [];

    final _rawData =
        await rootBundle.loadString("assets/xl/${csv.csvName}.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    for (var i = 1; i < _listData.length; i++) {
      var row = _listData[i];
      var voc = row[0];
      var vocMn = row[1]; //!.value.toString();
      var example = row[2];
      var exampleTr = csv.csvName == "wordN5"
          ? row[4]
          : ""; // == null ? "" : row[4]!.value.toString();

      var vocabulary = Dictionary()
        ..level = 5
        ..word = voc
        ..kanji = ""
        ..translate = vocMn
        ..example = example
        ..exampleTr = csv.csvName == "wordN5" ? exampleTr : ""
        ..wordType = csv.csvName;
      if (!vocabulary.word.contains("null") &&
          !vocabulary.translate.contains("null")) lstData.add(vocabulary);
    }
    return lstData;
    // await lstN5.box.put("${csv.dbName}", lstData);
  }

  Future<List<Dictionary>> loadXL(CsvInfo csv) async {
    List<Dictionary> lstData = [];

    // ByteData _rawData =
    //     await rootBundle.load("assets/xl/${csv.csvName}.csv");
    ByteData _rawData = await rootBundle.load("assets/xl/${csv.csvName}.xlsx");
    var bytes = _rawData.buffer
        .asUint8List(_rawData.offsetInBytes, _rawData.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
      var row = excel.tables["tr"]!.rows[i];
      print(row[0]!.value.toString());
      // for (var i = 1; i < _listData.length; i++) {
      //   var row = _listData[i];
      var voc = row[0]!.value.toString();
      var vocMn = row[1]!.value.toString(); //!.value.toString();
      var example = row[2]!.value.toString();
      var exampleTr = csv.csvName == "wordN5"
          ? row[4]!.value.toString()
          : ""; // == null ? "" : row[4]!.value.toString();

      var vocabulary = Dictionary()
        ..level = 5
        ..word = voc
        ..kanji = ""
        ..translate = vocMn
        ..example = example
        ..exampleTr = csv.csvName == "wordN5" ? exampleTr : ""
        ..wordType = csv.csvName;
      if (!vocabulary.word.contains("null") &&
          !vocabulary.translate.contains("null")) lstData.add(vocabulary);
    }

    return lstData;
  }

  Future<void> readExcelFile(String fileName) async {
    // await _loadCSV();
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();
    var lstData = [];
    ByteData data =
        await rootBundle.load("assets/xl/Vocabulary_of_JLPT_N5.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var i = 0; i < excel.tables["tr"]!.rows.length; i++) {
      var row = excel.tables["tr"]!.rows[i];
      print(row[0]);
      // mp[++j] = row;
      if ( //row[5] == null ||
          row[1] == null || row[1]!.value.toString().isEmpty) {
        continue;
      }

      var voc = row[0]!.value.toString();
      var kanji = row[1] == null ? "" : row[1]!.value.toString();
      var vocMn = row[3] == null ? "" : row[3]!.value.toString();
      var exampleTr = row[4] == null ? "" : row[4]!.value.toString();

      var exampleCell = row[2]!.value.toString();
      var exampleLst = exampleCell.split("\n");
      var exampleSentence =
          exampleLst.length < 2 ? "" : exampleLst[1].split("。")[0];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = voc
        ..kanji = kanji
        ..translate = vocMn
        ..example = exampleSentence
        ..exampleTr = exampleTr
        ..wordType = "allVocabulary";
      if (!vocabulary.word.contains("null") &&
          !vocabulary.translate.contains("null")) lstData.add(vocabulary);
      // lstN5.box.add(person2);
    }
    await lstN5.box.put("N5Words", lstData);
  }
}
