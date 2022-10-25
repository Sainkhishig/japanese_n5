import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:afen_vocabulary/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final adverbCardProvider =
    StateNotifierProvider<AdverbCardPageController, VocabularyModel>((ref) {
  return AdverbCardPageController(widgetRef: ref);
});

class AdverbCardPageController extends StateNotifier<VocabularyModel> {
  AdverbCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;

  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(adverbCardProvider);

    preferences = ref.read(sharedPreferencesProvider);
  }

  void setLevel(int level) {
    state = state.copyWith(pageIndex: level);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
