import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/n5/learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final commonKanjiCardProvider =
    StateNotifierProvider<CommonKanjiCardPageController, VocabularyModel>(
        (ref) {
  return CommonKanjiCardPageController(widgetRef: ref);
});

class CommonKanjiCardPageController extends StateNotifier<VocabularyModel> {
  CommonKanjiCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  dynamic getHiveBox(int level) => getJlptBoxByLevel(widgetRef, level);
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonKanjiCardProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  void setLevel(int level) {
    state = state.copyWith(pageIndex: level);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
