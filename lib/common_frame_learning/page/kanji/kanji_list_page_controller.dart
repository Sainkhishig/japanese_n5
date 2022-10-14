import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/object/kanji_dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final kanjiListProvider =
    StateNotifierProvider<KanjiListPageController, VocabularyModel>((ref) {
  return KanjiListPageController(widgetRef: ref);
});

class KanjiListPageController extends StateNotifier<VocabularyModel> {
  KanjiListPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(kanjiListProvider);
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

    final _rawData = await rootBundle.loadString("assets/xl/kanji.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    for (var i = 1; i < _listData.length; i++) {
      // 日,өдөр,"nichi, jitsu","hi, ka",明日,маргааш,あす

      var row = _listData[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var onReading = row[2];
      var kunReading = row[3];
      var example = row[4];
      var exampleTr = row[5];
      var exampleReading = row[6];

      var kanjiDic = KanjiDictionary()
        ..level = 5
        ..kanji = kanji
        ..translate = translate
        ..onReading = onReading
        ..kunReading = kunReading
        ..example = example
        ..exampleTr = exampleTr
        ..exampleReading = exampleReading;
      lstData.add(kanjiDic);
      // lstN5.box.add(person2);
    }
    state = state.copyWith(lstVocabulary: lstData);
    await lstN5.box.put("N5Kanji", lstData);
  }
}
