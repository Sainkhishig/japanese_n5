import 'package:afen_vocabulary/card/table_serving_progress_model.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider = StateNotifierProvider<VocabularyListPageController,
    TableServingProgressModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController
    extends StateNotifier<TableServingProgressModel> {
  VocabularyListPageController({required this.widgetRef})
      : super(const TableServingProgressModel());

  final StateNotifierProviderRef widgetRef;
  @override
  TableServingProgressModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocListProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

  Future<void> readExcelFile(String fileName) async {
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
        ..exampleTr = exampleTr;
      if (!vocabulary.word.contains("null") &&
          !vocabulary.translate.contains("null")) lstData.add(vocabulary);
      // lstN5.box.add(person2);
    }
    await lstN5.box.put("N5Words", lstData);
  }
}
