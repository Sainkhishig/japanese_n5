import 'package:excel/excel.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/hive_db/object/dictionary.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'n5_common_page_model.dart';
import 'package:flutter/services.dart';

final n5commonPageProvider =
    StateNotifierProvider<N5CommonPageController, N5CommonPageModel>((ref) {
  return N5CommonPageController(ref: ref);
});

class N5CommonPageController extends StateNotifier<N5CommonPageModel> {
  N5CommonPageController({required this.ref})
      : super(const N5CommonPageModel());
  final StateNotifierProviderRef ref;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  void setModelListenable(WidgetRef ref) {
    ref.watch(n5commonPageProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  void refresh() {
    state = state;
  }

  Future<void> prepareVocabulary() async {
    // await loadWordN5();
    List<Dictionary> allWords = [];
    var lstN5 = ref.read(n5BoxDataProvider);
    await lstN5.box.clear();
    allWords.addAll(await loadWordN5());
    allWords.addAll(await loadWordAdjective());
    allWords.addAll(await loadAdverb());
    allWords.addAll(await loadParticle());
    allWords.addAll(await loadWordVerb());
    await lstN5.box.put("vocabularyDB", allWords);
  }

  Future<List<Dictionary>> loadWordVerb() async {
    List<Dictionary> lstData = [];
    var lstN5 = ref.read(n5BoxDataProvider);
    ByteData data = await rootBundle.load("assets/xl/verb.xlsx");
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
        ..wordType = "verb";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Verb", lstData);
    return lstData;
  }

  Future<List<Dictionary>> loadWordAdjective() async {
    List<Dictionary> lstData = [];
    var lstN5 = ref.read(n5BoxDataProvider);
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
    var lstN5 = ref.read(n5BoxDataProvider);
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
    var lstN5 = ref.read(n5BoxDataProvider);
    // await lstN5.box.clear();
    ByteData data = await rootBundle.load("assets/xl/csvadverb.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
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
    var lstN5 = ref.read(n5BoxDataProvider);
    ByteData data = await rootBundle.load("assets/xl/csvparticle.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
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
        ..wordType = "particle";
      lstData.add(vocabulary);
    }

    await lstN5.box.put("N5Particle", lstData);

    return lstData;
  }

  setMasterDataDestination(String masterDest) async {
    state = state.copyWith(masterDataDestination: masterDest);
  }

  setVocabularyDestination(String destination) async {
    state = state.copyWith(vocabularyMenuDestination: destination);
  }

  setGameMode(bool isGameMode) async {
    state = state.copyWith(isGameMode: isGameMode);
  }

  // refreshState(String? uuid) async {
  //   state = state.copyWith(userName: uuid ?? "");
  // }

  int get railIndex => state.railIndex;
  void setRailIndex(int index) {
    state = state.copyWith(railIndex: index);
  }

  setSpeechVisible(bool isShow) async {
    var preferences = ref.read(sharedPreferencesProvider);
    await preferences.setBool("isShowSpeechIcon", isShow);
    state = state.copyWith(isShowSpeech: isShow);
  }
}
