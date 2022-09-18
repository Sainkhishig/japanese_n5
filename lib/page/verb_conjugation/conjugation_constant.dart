import 'conjugation_practice.dart';

List<ConjugationFormula> verbGodan = [
  ConjugationFormula(
      type: Conjugation.present,
      name: "Эелдэг",
      rowChanging: RowName.i,
      isRemove: false,
      suffix: "ます",
      description: "う мөр → い мөр + ます",
      example: "話す → 話します	",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.negative,
      name: "Үгүйсгэл",
      rowChanging: RowName.a,
      isRemove: false,
      suffix: "ない",
      description: "う мөр → あ мөр + ない",
      example: "",
      exception: "う төгсгөл わ	болно."),
  ConjugationFormula(
      type: Conjugation.past,
      name: "Эелдэг өнгөрсөн",
      rowChanging: RowName.i,
      isRemove: false,
      suffix: "ました",
      description: "う мөр → い мөр + ました",
      example: "話す → 話しました	",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.pastNegative,
      name: "Өнгөрсөн үгүйсгэл(эелдэг)",
      rowChanging: RowName.i,
      isRemove: false,
      suffix: "ませんでした",
      description: "う мөр → い мөр + ませんでした",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.presentNegative,
      name: "Үгүйсгэл (эелдэг)",
      rowChanging: RowName.i,
      isRemove: false,
      suffix: "ません",
      description: "う мөр → い мөр + ません",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.conditionalFormm,
      name: "Болзолт",
      rowChanging: RowName.e,
      isRemove: false,
      suffix: "ば",
      description: "う мөр  → え мөр + ば",
      example: "吸う → 吸えば,読めば ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.imperative,
      name: "Захирах, тушаах",
      rowChanging: RowName.e,
      isRemove: false,
      suffix: "",
      description: "う мөр  → え мөр + ば",
      example: "吸う → 吸えば,読めば",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.imperative2,
      name: "Захирах, тушаах 2",
      rowChanging: RowName.a,
      isRemove: false,
      suffix: "なさい",
      description: "う мөр → あ мөр + なさい",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional,
      name: "Хамтрах, уриалах",
      rowChanging: RowName.o,
      isRemove: false,
      suffix: "う",
      description: "う мөр  → お мөр + う",
      example: "話す→ 話そう",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional2,
      name: "Хамтрах, уриалах 2",
      rowChanging: RowName.i,
      isRemove: false,
      suffix: "ましょう",
      description: "う мөр ＋ い мөр + ましょう",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.potential,
      name: "Чадамж заах",
      rowChanging: RowName.e,
      isRemove: false,
      suffix: "る",
      description: "う мөр  → えмөр + る",
      example: "話す→ 話せる",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.passive,
      name: "Үйлдэгдэх",
      rowChanging: RowName.a,
      isRemove: false,
      suffix: "れる",
      description: "う мөр → あ мөр + れる",
      example: "聞く→ 聞かれる",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causative,
      name: "Үйлдүүлэх",
      rowChanging: RowName.a,
      isRemove: false,
      suffix: "せる",
      description: "う мөр → あ мөр + せる",
      example: "話す→ 話させる",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causativePassive,
      name: "Үйлдүүлэгдэх",
      rowChanging: RowName.a,
      isRemove: false,
      suffix: "せられる",
      description: "う мөр → あ мөр + せられる",
      example: "",
      exception: ""),
];
/**GROUP2 */

List<ConjugationFormula> verbIchidan = [
  ConjugationFormula(
      type: Conjugation.present,
      name: "Эелдэг",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "ます",
      description: "る төгсгөлийг хасч + ます",
      example: "食べる→ 食べます	",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.negative,
      name: "Үгүйсгэл",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "ない",
      description: "る төгсгөлийг хасч + ない",
      example: "食べる → 食べない",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.past,
      name: "Эелдэг өнгөрсөн",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "ました",
      description: "る төгсгөлийг хасч +  ました",
      example: "食べました	",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.pastNegative,
      name: "Өнгөрсөн үгүйсгэл(эелдэг)",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "ませんでした",
      description: "る төгсгөлийг хасч + ませんでした",
      example: "食べませんでした",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.presentNegative,
      name: "Үгүйсгэл(эелдэг)",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "ません",
      description: "る төгсгөлийг хасч + ません",
      example: "食べません",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.conditionalFormm,
      name: "Болзолт",
      rowChanging: RowName.e,
      isRemove: false,
      suffix: "ば",
      description: "う мөр  → え мөр + ば",
      example: "食べる → 食べれば ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.imperative,
      name: "Захирах, тушаах",
      rowChanging: RowName.o,
      isRemove: false,
      suffix: "",
      description: "う мөр  → お мөр",
      example: "食べる → 食べろ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.imperative2,
      name: "Захирах, тушаах 2",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "なさい",
      description: "る төгсгөлийг хасч + なさい",
      example: "食べる → 食べなさい",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional,
      name: "Хамтрах, уриалах",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "よう",
      description: "る → よう ",
      example: "食べる → 食べよう",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional2,
      name: "Хамтрах, уриалах 2",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "ましょう",
      description: "る төгсгөлийг хасч + ましょう",
      example: "食べる→一食べましょう",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.potential,
      name: "Чадамж заах",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "られる",
      description: "る → られる",
      example: "食べる → 食べられる",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.passive,
      name: "Үйлдэгдэх",
      rowChanging: RowName.a,
      isRemove: true,
      suffix: "られる",
      description: "る → られる",
      example: "食べる → 食べられる",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causative,
      name: "Үйлдүүлэх",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "させる",
      description: "る →  させる",
      example: "食べる → 食べさせる ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causativePassive,
      name: "Үйлдүүлэгдэх",
      rowChanging: RowName.a,
      isRemove: true,
      suffix: "させられる",
      description: "る → させられる",
      example: "見せる → 昔の写真を見させられる",
      exception: ""),
];

/**GROUP3 */
List<ConjugationFormula> verbIrregular = [
  ConjugationFormula(
      type: Conjugation.present,
      name: "Эелдэг",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "します, きます",
      description: "する → します, 来る → きます",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.negative,
            name: "Үгүйсгэл",
      rowChanging: RowName.a,
      isRemove: true,
      suffix: "しない,こない",
      description: "する → しない, くる → こない",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.past,
      name: "Эелдэг өнгөрсөн",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "しました, きました",
      description: "する → しました, くる →	きました",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.pastNegative,
            name: "Өнгөрсөн үгүйсгэл(эелдэг)",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "しませんでした, きませんでした",
      description: "する → しませんでした, くる →	きませんでした",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.presentNegative,
            name: " үгүйсгэл(эелдэг)",
      rowChanging: RowName.i,
      isRemove: true,
      suffix: "しません, きません",
      description: "する → しません, くる →	きません",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.conditionalFormm,
      name: "Болзолт",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "すれば,これば",
      description: "する → すれば,くる  → これば",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.imperative,
      name: "Захирах, тушаах",
      rowChanging: RowName.e,
      isRemove: true,
      suffix: "しなさい, きなさい",
      description: "する → しなさい, くる  → きなさい",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional,
      name: "Хамтрах, уриалах",
      rowChanging: RowName.o,
      isRemove: true,
      suffix: "しよう,こよう",
      description: "する → しよう,くる→ こよう",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.volitional2,
      name: "Хамтрах, уриалах 2",
      rowChanging: RowName.o,
      isRemove: true,
      suffix: "しましょう, 来ましょう",
      description: "する → しましょう, くる → 来ましょう",
      example: "",
      exception: ""),

/*
GROUP 3



*/
  ConjugationFormula(
      type: Conjugation.potential,
      name: "Чадамж заах",
      rowChanging: RowName.e,
      isRemove: true,
      suffix: "できる, こられる",
      description: "する → できる, くる → こられる",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.passive,
      name: "Үйлдэгдэх",
      rowChanging: RowName.a,
      isRemove: true,
      suffix: "される, こられる",
      description: "する → される, くる → こられる",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causative,
      name: "Үйлдүүлэх",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "させる , こさせる",
      description: "する → させる , くる → こさせる",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.causativePassive,
      name: "Үйлдүүлэгдэх",
      rowChanging: RowName.a,
      isRemove: true,
      suffix: "させられる, 来させられる",
      description: "する → させられる, くる  → 来させられる",
      example: "",
      exception: ""),
];

enum VerbGroup { godan, ichidan, irregular }

enum RowName { a, i, u, e, o }

enum FormulaType { remove, change }

enum Conjugation {
  present,
  negative,
  presentNegative,
  past,
  pastNegative,
  taForm,
  teForm,
  conditionalFormm,
  imperative,
  imperative2,
  volitional,
  volitional2,
  potential,
  passive,
  causative,
  causativePassive
}

class ConjugationResult {
  Conjugation conjugation;
  String conjugatedVerb;
  String desctiprion;
  String conjName;
  ConjugationResult({
    required this.conjugation,
    required this.conjugatedVerb,
    required this.desctiprion, required this.conjName,
  });
}

// const lstVerbGroupConjugation = [VerbGroupConjugation(group: VerbGroup.godan, lstConjugationForms: [])];

List<VerbGroupConjugation> lstVerbGroupConjugation = [
  VerbGroupConjugation(group: VerbGroup.godan, lstConjugationForms: verbGodan),
  VerbGroupConjugation(
      group: VerbGroup.ichidan, lstConjugationForms: verbIchidan),
  VerbGroupConjugation(
      group: VerbGroup.irregular, lstConjugationForms: verbIrregular),
];

class VerbGroupConjugation {
  VerbGroup group;
  List<ConjugationFormula> lstConjugationForms;

  VerbGroupConjugation({
    required this.group,
    required this.lstConjugationForms,
  });
}

class ConjugationFormula {
  Conjugation type;
  String name;
  RowName rowChanging;
  bool isRemove;
  String suffix;
  String description;
  String example;
  String exception;

  ConjugationFormula({
    required this.type,
    required this.name,
    required this.rowChanging,
    required this.isRemove,
    required this.suffix,
    required this.description,
    required this.example,
    required this.exception,
  });
}
