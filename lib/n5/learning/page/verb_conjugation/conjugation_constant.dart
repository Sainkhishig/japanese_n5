// Ru-verbs	る　 → 　て   : 	食べる → 食べて
// Irregular: する　→　 して 、くる → きて
// ta V1	う,つ,る　 →  った to the verb stem	笑う → 笑った
//           む, ぶ, ぬ  → 　んだ	  ：読む → 読んだ
//           く,ぐ　 → いた,いだ     :	働く→ 働いた, 泳ぐ → 泳いだ
//           す → した 	  :　おす→ おした
//           *** 行く→行った(irregular)
// te U-verbs	う,つ,る　 →  って    :吸う → 吸って
//         む, ぶ, ぬ  → 　んで  :読む → 読んで
//         く,ぐ　 → いて,いで  	書く→ 書いて , 泳ぐ → 泳いで
//         す → して	  :　おす→ おして

//         *** 行く(to go) → 行って（irregular*）

import 'package:kana_kit/kana_kit.dart';

List<ConjugationFormula> taFormGodan = [
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "う,つ,る",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "った",
      description: "う,つ,る　 →  った",
      example: "笑う → 笑った",
      exception: "※　行く→ 行った"),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "む, ぶ, ぬ",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "んだ",
      description: "む, ぶ, ぬ  → 　んだ",
      example: "読む → 読んだ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "く",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "いた",
      description: "く  → いて ",
      example: "書く→ 書いて",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "ぐ",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "いだ",
      description: "ぐ　→ いだ ",
      example: "泳ぐ → 泳いだ",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "す",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "した",
      description: "す → した",
      example: "おす→ おした",
      exception: "")
];

List<ConjugationFormula> teFormGodan = [
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "う,つ,る",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "って",
      description: "う,つ,る　 →  って",
      example: "笑う → 笑って",
      exception: "※　行く→行って"),
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "む, ぶ, ぬ",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "んで",
      description: "む, ぶ, ぬ  → 　んで",
      example: "読む → 読んで",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "く",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "いて",
      description: "く  → いて ",
      example: "書く→ 書いて",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "ぐ",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "いで",
      description: "ぐ　→ いで ",
      example: "泳ぐ → 泳いで",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "す",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "して",
      description: "す → して",
      example: "おす→ おして",
      exception: "")
];
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
      description: "う мөр  → え мөр",
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
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "て хэлбэр: -аад4",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "て",
      description: "る → て",
      example: "食べる → 食べて",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "た хэлбэр: -аад4",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "た",
      description: "る → た",
      example: "食べる → 食べた",
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
  ConjugationFormula(
      type: Conjugation.teForm,
      name: "て хэлбэр: -аад4",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "して, きて",
      description: "する　→　 して 、くる → きて",
      example: "",
      exception: ""),
  ConjugationFormula(
      type: Conjugation.taForm,
      name: "た хэлбэр: -аад4",
      rowChanging: RowName.u,
      isRemove: true,
      suffix: "した, きた",
      description: "する　→　した, くる → 来た",
      example: "",
      exception: ""),
];
List<String> lstVerb = [
  'あう',
  'あく',
  'あける',
  'あげる',
  'あそぶ',
  'あびる',
  'あらう',
  'ある',
  'ある',
  'あるく',
  'いう',
  'いく',
  'いる',
  'いる',
  'いれる',
  'うたう',
  'うまれる',
  'うる',
  'おきる',
  'おく',
  'おくる',
  'おす',
  'おぼえる',
  'およぐ',
  'おりる',
  'おわる',
  'かう',
  'かえす',
  'かえる',
  'かかる',
  'かく',
  'かける',
  'かける',
  'かす',
  'かぶる',
  'かりる',
  'きえる',
  'きく',
  'きる',
  'きる',
  'くる',
  'けす',
  'こたえる',
  'こまる',
  'さく',
  'さす',
  'しぬ',
  'しまる',
  'しめる',
  'しめる',
  'しる',
  'すう',
  'すむ',
  'する',
  'すわる',
  'だす',
  'たつ',
  'たのむ',
  'たべる',
  'ちがう',
  'つかう',
  'つかれる',
  'つく',
  'つくる',
  'つける',
  'つとめる',
  'でかける',
  'できる',
  'でる',
  'とぶ',
  'とまる',
  'とる',
  'とる',
  'なく',
  'ならぶ',
  'ならべる',
  'なる',
  'ぬぐ',
  'ねる',
  'のぼる',
  'のむ',
  'のる',
  'はいる',
  'はく',
  'はじまる',
  'はしる',
  'はたらく',
  'はなす',
  'はる',
  'はれる',
  'ひく',
  'ひく',
  'ふく',
  'ふる',
  'まがる',
  'まつ',
  'みがく',
  'みせる',
  'みる',
  'もつ',
  'やすむ',
  'やる',
  'よぶ',
  'よむ',
  'わかる',
  'わすれる',
  'わたす',
  'わたる'
];
// Irregular: する　→　 して 、くる → きて
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
    required this.desctiprion,
    required this.conjName,
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

var kanakit = KanaKit();
// べんきょうする
List<ConjugationResult> conjugate(
    VerbGroup group, verbKana, String verbEnding) {
  List<ConjugationResult> result = [];
  VerbGroupConjugation verbConjugation =
      lstVerbGroupConjugation.firstWhere((element) => element.group == group);

  verbConjugation.lstConjugationForms.forEach((formula) =>
      {result.add(conjugateByOne(group, formula, verbKana, verbEnding))});

  if (group == VerbGroup.godan) {
    var teFormula = teFormGodan
        .where(
            (element) => element.name.contains(kanakit.toHiragana(verbEnding)))
        .toList();
    var verbTeForm = conjugateByOne(group, teFormula[0], verbKana, verbEnding);
    if ((verbKana + verbEnding) == "iku" || (verbKana + verbEnding) == "行ku") {
      verbTeForm.conjugatedVerb = "いって";
    }
    result.add(verbTeForm);

    var taFormula = taFormGodan
        .where(
            (element) => element.name.contains(kanakit.toHiragana(verbEnding)))
        .toList();
    var verbTaForm = conjugateByOne(group, taFormula[0], verbKana, verbEnding);
    if ((verbKana + verbEnding) == "iku" || (verbKana + verbEnding) == "行ku") {
      verbTaForm.conjugatedVerb = "いった";
    }
    result.add(verbTaForm);
  }
  return result;
}

List<ConjugationResult> getTeFormExamples() {
  List<ConjugationResult> result = [];
  result.add(conjugateByOne(VerbGroup.godan, teFormGodan[0], "uta", "u"));
  result.add(conjugateByOne(VerbGroup.godan, teFormGodan[1], "yo", "mu"));
  result.add(conjugateByOne(VerbGroup.godan, teFormGodan[2], "hatara", "ku"));
  result.add(conjugateByOne(VerbGroup.godan, teFormGodan[3], "oyo", "gu"));
  result.add(conjugateByOne(VerbGroup.godan, teFormGodan[4], "o", "su"));
  return result;
}

List<ConjugationResult> getTaFormExamples() {
  List<ConjugationResult> result = [];
  result.add(conjugateByOne(VerbGroup.godan, taFormGodan[0], "uta", "u"));
  result.add(conjugateByOne(VerbGroup.godan, taFormGodan[1], "yo", "mu"));
  result.add(conjugateByOne(VerbGroup.godan, taFormGodan[2], "hatara", "ku"));
  result.add(conjugateByOne(VerbGroup.godan, taFormGodan[3], "oyo", "gu"));
  result.add(conjugateByOne(VerbGroup.godan, taFormGodan[4], "o", "su"));
  return result;
}

ConjugationResult conjugateByOne(VerbGroup group, ConjugationFormula formula,
    String verbKana, String verbEnding) {
  var conjugatedVerb = "";
  if (group == VerbGroup.irregular) {
    var suffixes = kanakit.toRomaji(formula.suffix).split(",");
    var currentSuffix = verbEnding == "suru" ? suffixes[0] : suffixes[1];

    conjugatedVerb = verbKana + kanakit.toHiragana(currentSuffix);
  } else if (formula.isRemove) {
    conjugatedVerb = verbKana + kanakit.toHiragana(formula.suffix);
  } else {
    conjugatedVerb = verbKana +
        kanakit.toHiragana(
            changeEndRow(verbEnding, formula.rowChanging) + formula.suffix);
  }
  var hiraganaConjugated = kanakit.toHiragana(conjugatedVerb);
  var conjugationName = formula.type == Conjugation.teForm
      ? "て хэлбэр"
      : formula.type == Conjugation.taForm
          ? "た хэлбэр"
          : formula.name;
  return ConjugationResult(
      conjugation: formula.type,
      conjugatedVerb: hiraganaConjugated,
      desctiprion: formula.description,
      conjName: conjugationName);
}

String changeEndRow(String verbEnd, RowName changeRow) {
  var changing = changeRow.toString().split(".")[1];
  var newEnd = "";

  if (verbEnd == "u" && changeRow == RowName.a) {
    newEnd = "wa";
  } else {
    newEnd = verbEnd.replaceAll("u", changing);
  }

  return newEnd;
}
