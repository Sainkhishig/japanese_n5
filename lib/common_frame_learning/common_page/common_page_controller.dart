import 'dart:typed_data';

import 'package:afen_vocabulary/common_providers/shared_preferences_provider.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/services.dart';
import 'common_model.dart';
import 'package:excel/excel.dart';

final commonPageProvider =
    StateNotifierProvider<CommonPageController, CommonPageModel>((ref) {
  return CommonPageController(widgetRef: ref);
});

class CommonPageController extends StateNotifier<CommonPageModel> {
  CommonPageController({required this.widgetRef})
      : super(const CommonPageModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  @override
  CommonPageModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonPageProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedIndex: index);
  }

  setVocabularyDestination(String destination) async {
    state = state.copyWith(vocabularyMenuDestination: destination);
  }

  setMasterDataDestination(String masterDest) async {
    state = state.copyWith(masterDataDestination: masterDest);
  }

  setGameMode(bool isGameMode) async {
    state = state.copyWith(isGameMode: isGameMode);
  }

  setSpeechVisible(bool isShow) async {
    var preferences = widgetRef.read(sharedPreferencesProvider);
    await preferences.setBool("isShowSpeechIcon", isShow);
    state = state.copyWith(isShowSpeech: isShow);
  }

  refreshState(String? uuid) async {
    state = state.copyWith(userName: uuid ?? "");
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
    allWords.addAll(await loadWordVerb());
    await lstN5.box.put("vocabularyDB", allWords);
  }

  Future<List<Dictionary>> loadWordVerb() async {
    List<Dictionary> lstData = [];
    var lstN5 = widgetRef.read(n5BoxDataProvider);
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
    var lstN5 = widgetRef.read(n5BoxDataProvider);
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
}
