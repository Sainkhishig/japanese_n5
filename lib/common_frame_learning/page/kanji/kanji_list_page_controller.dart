import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hishig_erdem/n5/reference_n5_common_model.dart';
import 'package:hishig_erdem/hive_db/object/kanji_dictionary.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final commonKanjiListProvider =
    StateNotifierProvider<CommonKanjiListPageController, VocabularyModel>(
        (ref) {
  return CommonKanjiListPageController(widgetRef: ref);
});

class CommonKanjiListPageController extends StateNotifier<VocabularyModel> {
  CommonKanjiListPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonKanjiListProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  dynamic getHiveBox(int level) => getJlptBoxByLevel(widgetRef, level);
  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSearchKey(String key) async {
    state = state.copyWith(searchKey: key);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

  Future<void> loadExcel() async {
    var lstN5 = widgetRef.read(n5BoxDataProvider);
    await lstN5.box.clear();
    var lstData = [];

    ByteData data = await rootBundle.load("assets/xl/kanji.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    var rows = excel.tables["Worksheet"]!.rows;

    for (var i = 1; i < rows.length; i++) {
      // 日,өдөр,"nichi, jitsu","hi, ka",明日,маргааш,あす

      var row = rows[i];
      var kanji = row[0];
      var translate = row[1]; //!.value.toString();
      var onReading = row[2];
      var kunReading = row[3];
      var example = row[4];
      var exampleTr = row[5];
      var exampleReading = row[6];

      var kanjiDic = KanjiDictionary()
        ..level = 5
        ..kanji = kanji!.value.toString()
        ..translate = translate!.value.toString()
        ..onReading = onReading!.value.toString()
        ..kunReading = kunReading!.value.toString()
        ..example = example!.value.toString()
        ..exampleTr = exampleTr!.value.toString()
        ..exampleReading = exampleReading!.value.toString();
      lstData.add(kanjiDic);
      // lstN5.box.add(person2);
    }
    state = state.copyWith(lstVocabulary: lstData);
    await lstN5.box.put("N5Kanji", lstData);
  }

  // Future<void> loadCSV() async {
  //   var lstN5 = widgetRef.read(n5BoxDataProvider);
  //   await lstN5.box.clear();
  //   var lstData = [];

  //   final _rawData = await rootBundle.loadString("assets/xl/kanji.csv");
  //   List<List<dynamic>> _listData =
  //       const CsvToListConverter().convert(_rawData);

  //   for (var i = 1; i < _listData.length; i++) {
  //     // 日,өдөр,"nichi, jitsu","hi, ka",明日,маргааш,あす

  //     var row = _listData[i];
  //     var kanji = row[0];
  //     var translate = row[1]; //!.value.toString();
  //     var onReading = row[2];
  //     var kunReading = row[3];
  //     var example = row[4];
  //     var exampleTr = row[5];
  //     var exampleReading = row[6];

  //     var kanjiDic = KanjiDictionary()
  //       ..level = 5
  //       ..kanji = kanji
  //       ..translate = translate
  //       ..onReading = onReading
  //       ..kunReading = kunReading
  //       ..example = example
  //       ..exampleTr = exampleTr
  //       ..exampleReading = exampleReading;
  //     lstData.add(kanjiDic);
  //     // lstN5.box.add(person2);
  //   }
  //   state = state.copyWith(lstVocabulary: lstData);
  //   await lstN5.box.put("N5Kanji", lstData);
  // }
}
