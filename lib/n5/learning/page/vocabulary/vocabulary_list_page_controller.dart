import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/hive_db/object/dictionary.dart';
import 'package:hishig_erdem/n5/reference_n5_common_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider =
    StateNotifierProvider<VocabularyListPageController, VocabularyModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController extends StateNotifier<VocabularyModel> {
  VocabularyListPageController({required this.widgetRef})
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
}
