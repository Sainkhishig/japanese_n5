import 'package:afen_vocabulary/page/master/verbForm/verb_form_model.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../letter_game_page.dart';

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
  List<ConjugationResult> conjugate(
      VerbGroup group, verbKana, String verbEnding) {
    VerbGroupConjugation verbConjugation =
        lstVerbGroupConjugation.firstWhere((element) => element.group == group);
    List<ConjugationFormula> conjugationFormulas =
        verbConjugation.lstConjugationForms;
    List<ConjugationResult> result = [];

    conjugationFormulas.forEach((formula) =>
        {result.add(conjugateByOne(group, formula, verbKana, verbEnding))});

    if (result.length > 0) {
      state = state.copyWith(lstVerbForms: result);
    }
    // lstRestult = result;
    return result;
  }

  ConjugationResult conjugateByOne(VerbGroup group, ConjugationFormula formula,
      String verbKana, String verbEnding) {
    var conjugatedVerb = "";
    if (group == VerbGroup.irregular) {
      var suffixes = kanakit.toRomaji(formula.suffix).split(",");
      var currentSuffix = verbEnding == "suru" ? suffixes[0] : suffixes[1];

      conjugatedVerb = verbKana + currentSuffix;
    } else if (formula.isRemove) {
      conjugatedVerb = verbKana + kanakit.toRomaji(formula.suffix);
    } else {
      conjugatedVerb = verbKana + changeEndRow(verbEnding, formula.rowChanging) + kanakit.toRomaji(formula.suffix);
    }
    var hiraganaCOnjugated = kanakit.toHiragana(conjugatedVerb);
    return ConjugationResult(
        conjugation: formula.type,
        conjugatedVerb: "$hiraganaCOnjugated ($conjugatedVerb)",
        desctiprion: formula.description,
        conjName: formula.name);
  }

  String changeEndRow(String verbEnd, RowName changeRow) {
    var changing =changeRow.toString().split(".")[1];
    var newEnd = verbEnd.replaceAll("u",changing );

    return newEnd;
  }

}
