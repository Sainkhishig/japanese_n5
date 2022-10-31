import 'package:hishig_erdem/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/hive_db/object/dictionary.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider =
    StateNotifierProvider<AdverbVocabularyPageController, VocabularyModel>(
        (ref) {
  return AdverbVocabularyPageController(widgetRef: ref);
});

class AdverbVocabularyPageController extends StateNotifier<VocabularyModel> {
  AdverbVocabularyPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocListProvider);
    preferences = ref.read(sharedPreferencesProvider);
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

  Future<void> loadCSV() async {
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();
    var lstData = [];

    final _rawData = await rootBundle.loadString("assets/xl/csvadverb.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    for (var i = 1; i < _listData.length; i++) {
      var row = _listData[i];
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
      if (!vocabulary.word.contains("null") &&
          !vocabulary.translate.contains("null")) lstData.add(vocabulary);
      // lstN5.box.add(person2);
    }
    state = state.copyWith(lstVocabulary: lstData);
    await lstN5.box.put("N5Adverb", lstData);
    // setState(() {
    //   _data = _listData;
    // });
  }
}
