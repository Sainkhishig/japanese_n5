import 'package:afen_vocabulary/page/master/verbForm/verb_form_model.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:state_notifier/state_notifier.dart';

final verbFormGamePageProvider =
    StateNotifierProvider<VerbFormGamePageController, VerbFormModel>((ref) {
  return VerbFormGamePageController(widgetRef: ref);
});

class VerbFormGamePageController extends StateNotifier<VerbFormModel> {
  VerbFormGamePageController({required this.widgetRef})
      : super(VerbFormModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VerbFormModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(verbFormGamePageProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setTestMode(bool mode) async {
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
      state = state.copyWith(lstVerbForms: result);
    }
    // lstRestult = result;
    return result;
  }
}
