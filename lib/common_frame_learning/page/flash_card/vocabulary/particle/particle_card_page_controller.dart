import 'package:hishig_erdem/n5/reference_n5_common_model.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final particleCardProvider =
    StateNotifierProvider<ParticleCardPageController, VocabularyModel>((ref) {
  return ParticleCardPageController(widgetRef: ref);
});

class ParticleCardPageController extends StateNotifier<VocabularyModel> {
  ParticleCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(particleCardProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  void setLevel(int level) {
    state = state.copyWith(pageIndex: level);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
