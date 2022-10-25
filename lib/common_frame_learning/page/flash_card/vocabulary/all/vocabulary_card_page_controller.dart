import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:afen_vocabulary/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final vocabularyCardProvider =
    StateNotifierProvider<VocabularyCardPageController, VocabularyModel>((ref) {
  return VocabularyCardPageController(widgetRef: ref);
});

class VocabularyCardPageController extends StateNotifier<VocabularyModel> {
  VocabularyCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocabularyCardProvider);
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
}
