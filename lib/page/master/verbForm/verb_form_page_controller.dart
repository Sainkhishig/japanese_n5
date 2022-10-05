import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'verb_form_model.dart';

final verbFormPageProvider =
    StateNotifierProvider<VerbFormPageController, VerbFormModel>((ref) {
  return VerbFormPageController(widgetRef: ref);
});

class VerbFormPageController extends StateNotifier<VerbFormModel> {
  VerbFormPageController({required this.widgetRef})
      : super(const VerbFormModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VerbFormModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(verbFormPageProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

// べんきょうする
  List<ConjugationResult> conjugateVerb(
      VerbGroup group, verbKana, String verbEnding) {
    return conjugate(group, verbKana, verbEnding);
  }
}
