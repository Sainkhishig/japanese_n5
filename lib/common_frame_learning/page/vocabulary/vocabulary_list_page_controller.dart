import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
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
    List<Dictionary> allWords = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();
    allWords.addAll(await loadWordN5());
    allWords.addAll(await loadWordAdjective());
    allWords.addAll(await loadAdverb());
    allWords.addAll(await loadParticle());
    await lstN5.box.put("vocabularyDB", allWords);
  }

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

  Future<List<Dictionary>> loadWordAdjective() async {
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    ByteData data = await rootBundle.load("assets/xl/adjectives.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    print("loadWordN52");
    for (var i = 0; i < excel.tables["Worksheet"]!.rows.length; i++) {
      var row = excel.tables["Worksheet"]!.rows[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var hiragana = row[2];

      var vocabulary = Dictionary()
        ..level = 5
        ..word = hiragana == null ? "" : hiragana.value
        ..kanji = kanji == null ? "" : kanji.value
        ..translate = translate == null ? "" : translate.value
        ..example = ""
        ..exampleTr = ""
        ..wordType = "adjective";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Adjective", lstData);
    return lstData;
  }

  Future<List<Dictionary>> loadWordN5() async {
    print("loadWordN5");
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    // await lstN5.box.clear();
    ByteData data = await rootBundle.load("assets/xl/wordN5.xlsx");
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
        ..wordType = "noun";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Words", lstData);

    print("done");
    print(lstData.length);
    return lstData;
  }

  Future<List<Dictionary>> loadAdverb() async {
    print("csvadverb");
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    // await lstN5.box.clear();
    ByteData data = await rootBundle.load("assets/xl/csvadverb.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
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
        ..wordType = "adverb";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Adverb", lstData);

    print("done");
    return lstData;
  }

  Future<List<Dictionary>> loadParticle() async {
    print("csvadverb");
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    ByteData data = await rootBundle.load("assets/xl/csvparticle.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
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
        ..wordType = "particle";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Particle", lstData);

    return lstData;
  }
}
