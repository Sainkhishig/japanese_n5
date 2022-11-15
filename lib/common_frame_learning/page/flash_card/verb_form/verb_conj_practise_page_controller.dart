import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/n5/learning/page/master/verbForm/verb_form_model.dart';
import 'package:hishig_erdem/n5/learning/page/verb_conjugation/conjugation_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final verbConjPracticePageProvider =
    StateNotifierProvider<VerbConjPracticePageProvider, VerbFormModel>((ref) {
  return VerbConjPracticePageProvider(widgetRef: ref);
});

class VerbConjPracticePageProvider extends StateNotifier<VerbFormModel> {
  VerbConjPracticePageProvider({required this.widgetRef})
      : super(VerbFormModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VerbFormModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(verbConjPracticePageProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setExerciseMode(bool mode) async {
    state = state.copyWith(isTestMode: mode);
  }

  setVerb(String verb) async {
    state = state.copyWith(currentVerb: verb);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

// べんきょうする
  List<ConjugationResult> conjugateVerb(
      VerbGroup group, verbKana, String verbEnding) {
    List<ConjugationResult> result = conjugate(group, verbKana, verbEnding);
    var currentV = KanaKit().toHiragana("$verbKana$verbEnding");
    if (result.isNotEmpty) {
      state = state.copyWith(lstConjugateResult: result);
    }
    // lstRestult = result;
    return result;
  }
}
