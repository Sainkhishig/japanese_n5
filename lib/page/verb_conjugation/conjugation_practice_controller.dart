import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';

import 'conjugation_constant.dart';

final conjugationPractiseController =
    StateNotifierProvider<ConjugationPracticeController, int>(
        (ref) => ConjugationPracticeController(ref: ref));

class ConjugationPracticeController extends StateNotifier<int> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  ConjugationPracticeController({required this.ref}) : super(0);
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  int get result => state;
  var kanakit = const KanaKit();

  List<ConjugationResult> lstRestult = [];

  void setModelListenable(WidgetRef ref) {
    // var dbReference: DatabaseReference
    // writeData();
    ref.watch(conjugationPractiseController);
    // List<Example> lstExample = [];
    // lstExample.add(Example("jishee1", "Husel buhen biellee olchihson baina."));
    // lstExample
    //     .add(Example("jishee2", "orchuulga2 orchuulga2 orchuulga2 orchuulga2"));
    // state = state.copyWith(lstExample: lstExample);
  }

// べんきょうする
  List<ConjugationResult> conjugate(
      VerbGroup group, verbKana, String verbEnding) {
    VerbGroupConjugation verbConjugation =
        lstVerbGroupConjugation.firstWhere((element) => element.group == group);
    List<ConjugationFormula> conjugationFormulas =
        verbConjugation.lstConjugationForms;
    List<ConjugationResult> result = [];

    for (var formula in conjugationFormulas) {
      {
        result.add(conjugateByOne(group, formula, verbKana, verbEnding));
      }
    }

    if (result.length > 0) {
      state = state++;
    }
    lstRestult = result;
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
      conjugatedVerb = verbKana +
          changeEndRow(verbEnding, formula.rowChanging) +
          kanakit.toRomaji(formula.suffix);
    }
    var hiraganaCOnjugated = kanakit.toHiragana(conjugatedVerb);
    return ConjugationResult(
        conjugation: formula.type,
        conjugatedVerb: "$hiraganaCOnjugated",
        desctiprion: formula.description,
        conjName: formula.name);
  }

  String changeEndRow(String verbEnd, RowName changeRow) {
    var changing = changeRow.toString().split(".")[1];
    var newEnd = verbEnd.replaceAll("u", changing);

    return newEnd;
  }

  // String getConjunctionName(RowName verbEnd, RowName changeRow) {
  //   var verbEnding = "";
  //   verbEnding.replaceAll("u", changeRow.toString());

  //   return verbEnding;
  // }
  //#endregion ==================== method ====================
}

// NOTE: 画面ごとにFilterが異なる
enum FilterTag {
  use,
  disused,
}

extension FilterTagExtension on FilterTag {
  static final typeLabels = {
    FilterTag.use: '使用',
    FilterTag.disused: '不用',
  };

  String get label => typeLabels[this]!;
}
