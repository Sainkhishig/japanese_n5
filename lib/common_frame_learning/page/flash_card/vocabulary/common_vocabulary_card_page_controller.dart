import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/n5/reference_n5_common_model.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final commonVocabularyCardProvider =
    StateNotifierProvider<CommonVocabularyCardPageController, VocabularyModel>(
        (ref) {
  return CommonVocabularyCardPageController(widgetRef: ref);
});

class CommonVocabularyCardPageController
    extends StateNotifier<VocabularyModel> {
  CommonVocabularyCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  dynamic getHiveBox(int level) => getJlptBoxByLevel(widgetRef, level);
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonVocabularyCardProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  void setLevel(int level) {
    state = state.copyWith(pageIndex: level);
  }

  void setDb(int dbIndexh) {
    state = state.copyWith(dbNameIndex: dbIndexh);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSelectedPageIndex(int index) async {
    state = state.copyWith(selectedPageIndex: index, selectedCardIndex: 1);
  }
}
