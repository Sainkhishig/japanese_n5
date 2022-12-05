import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/n5/reference_n5_common_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  setShowKanji(int index, XlKanjiHiveModel selectedKanji) async {
    state = state.copyWith(
        selectedKanjiIndex: index, selectedKanjiInfo: selectedKanji);
  }
}
