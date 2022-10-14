// 書きます
// 書きまして"
// 書きました"
// 書きません"
// 書きませんでした"
// 書かれます"
// 書かせます"
// 書かされます"
// 書けます"
// 書きましょう"

//　書く
// "書いて
// "書いた
// "書かない
// "書かなかった
// "書かれる
// "書かせる
// "書かされる
// "書ける
// "書こう

// 書け
// 書けば
//
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kana_kit/kana_kit.dart';

import 'conjugation_constant.dart';
import 'conjugation_practice_controller.dart';

// ignore: must_be_immutable
class ConjugationPractise extends HookConsumerWidget {
  ConjugationPractise({Key? key}) : super(key: key);
  // List<TagModel> _tags = [];
  // final List<TagModel> _tagsToSelect = [
  //   TagModel(id: '1', title: 'JavaScript'),
  //   TagModel(id: '2', title: 'Python'),
  //   TagModel(id: '3', title: 'Java'),
  //   TagModel(id: '4', title: 'PHP'),
  //   TagModel(id: '5', title: 'C#'),
  //   TagModel(id: '6', title: 'C++'),
  //   TagModel(id: '7', title: 'Dart'),
  //   TagModel(id: '8', title: 'DataFlex'),
  //   TagModel(id: '9', title: 'Flutter'),
  //   TagModel(id: '10', title: 'Flutter Selectable Tags'),
  //   TagModel(id: '11', title: 'Android Studio developer'),
  // ];

  late TextEditingController tcVerb,
      tcLevel,
      tcGrammer,
      tcFormula,
      tcMeaning,
      tcSame,
      tcAttention,
      tcNote,
      tcIdiom;
  var kanakit = const KanaKit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(conjugationPractiseController.notifier);
    controller.setModelListenable(ref);
    // readExcelFile("grammerdata.xlsx");
    useEffect(() {
      tcVerb = TextEditingController();
    }, const []);
    var listDragItem = controller.lstRestult
        .map(
          (verbResult) => ConfugationSubmitForm(verbResult),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Үйл үгийн хувирал'),
        automaticallyImplyLeading: false,
      ),
      // drawer: const CommonDrawer(),
      body: Column(
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: tcVerb,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
            child: const Text("хувиргах"),
            onPressed: () async {
              VerbGroup group;
              var verb = tcVerb.text;
              var verbEnding = "";

              var verbKana =
                  kanakit.isRomaji(verb) ? verb.trim() : kanakit.toRomaji(verb);

              if (verbKana.endsWith("suru") || verbKana.endsWith("kuru")) {
                if (verbKana.endsWith("suru")) {
                  verbEnding = "suru";
                } else {
                  verbEnding = "kuru";
                }
                group = VerbGroup.irregular;
              } else if ((verbKana.endsWith("eru") ||
                      verbKana.endsWith("iru")) ||
                  lstIrregularGodan.contains(verbKana)) {
                if (verbKana.endsWith("eru")) {
                  verbEnding = "ru";
                } else {
                  verbEnding = "ru";
                }
                group = VerbGroup.ichidan;
              } else {
                for (var endGodan in lstGodanEnding) {
                  if (verbKana.endsWith(kanakit.toRomaji(endGodan))) {
                    verbEnding = kanakit.toRomaji(endGodan);
                  }
                }
                group = VerbGroup.godan;
              }
              var verbRoot = verbKana.split(verbEnding)[0];
              List<ConjugationResult> conjugationResuls =
                  controller.conjugate(group, verbRoot, verbEnding);
              // verb.endsWith(other)
            },
          ),
          ListView.builder(
              itemCount: listDragItem.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return listDragItem[index].build(context, ref);
              }),
        ],
      ),
    );
  }
}

/*



Ru-verbs	る　 → 　て   : 	食べる → 食べて
Irregular: する　→　 して 、くる → きて
ta V1	う,つ,る　 →  った to the verb stem	笑う → 笑った
          む, ぶ, ぬ  → 　んだ	  ：読む → 読んだ
          く,ぐ　 → いた,いだ     :	働く→ 働いた, 泳ぐ → 泳いだ
          す → した 	  :　おす→ おした
          *** 行く→行った(irregular)
te U-verbs	う,つ,る　 →  って    :吸う → 吸って 
        む, ぶ, ぬ  → 　んで  :読む → 読んで 
        く,ぐ　 → いて,いで  	書く→ 書いて , 泳ぐ → 泳いで 
        す → して	  :　おす→ おして
        
        *** 行く(to go) → 行って（irregular*） 

 */
// List<ConjugationFormula> verbGodanPolite = [
//   ConjugationFormula(
//       type: Conjugation.present,
//       name: "Эелдэг",
//       rowChanging: RowName.i,
//       isRemove: false,
//       suffix: "ます",
//       description: "う мөр　 → 　い мөр + ます",
//       example: "話す → 話します	",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.negative,
//       name: "",
//       rowChanging: RowName.a,
//       isRemove: false,
//       suffix: "ない",
//       description: "う мөр　 → 　あ мөр　+　ない",
//       example: "",
//       exception: "う төгсгөл わ	болно."),
//   ConjugationFormula(
//       type: Conjugation.past,
//       name: "Эелдэг өнгөрсөн",
//       rowChanging: RowName.i,
//       isRemove: false,
//       suffix: "ました",
//       description: "う мөр　 → 　い мөр + ました",
//       example: "話す → 話しました	",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.pastNegative,
//       name: "",
//       rowChanging: RowName.i,
//       isRemove: false,
//       suffix: "ませんでした",
//       description: "う мөр　 → 　い мөр + ませんでした",
//       example: "",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.presentNegative,
//       name: "",
//       rowChanging: RowName.i,
//       isRemove: false,
//       suffix: "ません",
//       description: "う мөр　 → 　い мөр + ません",
//       example: "",
//       exception: ""),

//   // ConjugationFormula(
//   //     type: Conjugation.teForm,
//   //     name: "",
//   //     rowChanging: RowName.u,
//   //     isRemove: false,
//   //     suffix: "ます",
//   //     description: "",
//   //     example: "",
//   //     exception: ""),
//   // ConjugationFormula(
//   //     type: Conjugation.taForm,
//   //     name: "",
//   //     rowChanging: RowName.u,
//   //     isRemove: false,
//   //     suffix: "ます",
//   //     description: "",
//   //     example: "",
//   //     exception: ""),

//   ConjugationFormula(
//       type: Conjugation.conditionalFormm,
//       name: "Болзолт",
//       rowChanging: RowName.u,
//       isRemove: false,
//       suffix: "ば",
//       description: "う мөр　  → 　え мөр　+　ば",
//       example: "吸う → 吸えば、読めば ",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.imperative,
//       name: "Захирах, тушаах",
//       rowChanging: RowName.e,
//       isRemove: false,
//       suffix: "ば",
//       description: "う мөр　  → 　え мөр　+　ば",
//       example: "吸う → 吸えば、読めば",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.imperative2,
//       name: "Захирах, тушаах 2",
//       rowChanging: RowName.a,
//       isRemove: false,
//       suffix: "なさい",
//       description: "う мөр　 → 　あ мөр　+ なさい",
//       example: "",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.volitional,
//       name: "Хамтрах, уриалах",
//       rowChanging: RowName.o,
//       isRemove: false,
//       suffix: "う",
//       description: "う мөр　  → 　お　мөр　+ う",
//       example: "話す→ 話そう",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.volitional2,
//       name: "Хамтрах, уриалах 2",
//       rowChanging: RowName.o,
//       isRemove: false,
//       suffix: "ましょう",
//       description: "う мөр　＋　い мөр　+　ましょう",
//       example: "",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.potential,
//       name: "Чадамж заах",
//       rowChanging: RowName.e,
//       isRemove: false,
//       suffix: "る",
//       description: "う мөр　  → 　えмөр　+ る",
//       example: "話す→ 話せる",
//       exception: ""),

//   ConjugationFormula(
//       type: Conjugation.passive,
//       name: "Үйлдэгдэх",
//       rowChanging: RowName.a,
//       isRemove: false,
//       suffix: "れる",
//       description: "う мөр　 → 　あ мөр　+ れる",
//       example: "聞く→ 聞かれる",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.causative,
//       name: "Үйлдүүлэх",
//       rowChanging: RowName.u,
//       isRemove: false,
//       suffix: "せる",
//       description: "う мөр　 → 　あ мөр + せる",
//       example: "話す→ 話させる",
//       exception: ""),
//   ConjugationFormula(
//       type: Conjugation.causativePassive,
//       name: "Үйлдүүлэгдэх",
//       rowChanging: RowName.a,
//       isRemove: false,
//       suffix: "せられる",
//       description: "う мөр　 → 　あ мөр + せられる",
//       example: "",
//       exception: ""),
// ];
//べんきょうする

class ConfugationSubmitForm extends HookConsumerWidget {
  ConfugationSubmitForm(this.result, {Key? key}) : super(key: key);
  final ConjugationResult result;

  final TextEditingController tecStartDay = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Row(
              children: [
                // const Icon(
                //   Icons.check_circle_outlined,
                //   // color: LightTheme.primary,
                // ),

                Text(
                  "${result.conjName}: ${result.conjugatedVerb}",
                  // fontColor: LightTheme.teriary,
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(8.0),
            children: [Text(result.desctiprion)],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        // Expanded(
        //   child: TextFormField(
        //     controller: tecStartDay,
        //     decoration: const InputDecoration(border: OutlineInputBorder()),
        //   ),
        // ),
      ],
    );
  }
}

// class ConfugationEditForm extends HookConsumerWidget {
//   ConfugationEditForm(this.label, {Key? key}) : super(key: key);
//   final String? label;

//   final TextEditingController tecStartDay = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(
//       children: [
//         ExpansionTile(
//           tilePadding: EdgeInsets.zero,
//           title: Row(
//             children: [
//               const Icon(
//                 Icons.g_translate_outlined,
//                 // color: LightTheme.primary,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 "$label",
//                 // fontColor: LightTheme.teriary,
//               ),
//             ],
//           ),
//           childrenPadding: const EdgeInsets.all(8.0),
//           children: const [Text("ConjugationFormula")],
//         ),
//       ],
//     );
//   }
// }

class TagModel {
  String id;
  String title;

  TagModel({
    required this.id,
    required this.title,
  });
}

// List<GrammarFormula> lstConjugation = [
//   GrammarFormula(
//       grammar: 'Энгийн', godan: '', ichidan: "", irregular: "します , 来ます"),
//   GrammarFormula(grammar: 'үйлдэгдэх', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'үйлдүүлэх', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(
//       grammar: 'үйлдүүлэгдэх', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'чадамж', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'уриалах', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'үргэлжлэх', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'захирах', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'болзолт', godan: '', ichidan: "", irregular: ""),
// ];

// List<GrammarFormula> lstPlainForm = [
//   GrammarFormula(grammar: 'Одоо', godan: '', ichidan: "", irregular: "する、 くる"),
//   GrammarFormula(
//       grammar: 'Үгүйсгэх', godan: '', ichidan: "", irregular: "しない, くない"),
//   GrammarFormula(
//       grammar: 'Өнгөрсөн', godan: '', ichidan: "", irregular: "した、きた"),
//   GrammarFormula(
//       grammar: 'Өнгөрсөн үгүйсгэл',
//       godan: '',
//       ichidan: "",
//       irregular: "しなかった、くなかった"),
// ];

// List<GrammarFormula> lstPoliteForm = [
//   GrammarFormula(
//       grammar: 'Одоо', godan: '', ichidan: "", irregular: "します , 来ます"),
//   GrammarFormula(grammar: 'Үгүйсгэх', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(grammar: 'Өнгөрсөн', godan: '', ichidan: "", irregular: ""),
//   GrammarFormula(
//       grammar: 'Өнгөрсөн үгүйсгэл', godan: '', ichidan: "", irregular: ""),
// ];

/**
 Irregularverbs/V3	来る	来る(kuru/to come)
する	する(suru/to do)
Kanji+する	勉強する(benkyousuru/to study)
Ru-verbs / V2	A kana from い/えcolumn +る	寝る(neru/to sleep)
食べる(taberu/to eat)
着る(kiru/to wear)
U-verbs / V1	Most verbs ending in a u-kana and everything except V3 and V2	飲む(nomu/to drink)
買う(kau/to buy)
書く(kaku/to write)
死ぬ* (sinu/to die)


 */
// 書きます　// 書きません" // 書きました"　// 書きませんでした"
// 書かれます" үйлдэгдэх
// 書かせます" үйлдүүлэх
// 書かされます" үйлдүүлэгдэх
// 書けます" чадамж
// 書きましょう" уриалах
// 書きまして" үргэлжлэх

//　書く　// "書かない
// "書いた　// "書かなかった

// "書かれる
// "書かせる
// "書かされる
// "書ける
// "書こう
// "書いて

// 書け
// 書けば

/*

masu
V1	う мөр　 → 　い мөр + ます　 ：	話す → 話します	
V2	る　 → 　ます 	：食べる→ 食べます
V3	する　 → 　します、　来る　 → 　きます
	
*/

/*
  form - nai
  V1	う мөр　 → 　あ мөр　+　ない	*** うтөгсгөл わ	болно.
  
  V2	る　 → 　ない	食べる → 食べない	
  V3	する becomes しない	くる→こない

 */

/**
 form ta
 V1	う,つ,る　 →  った to the verb stem	笑う → 笑った
          む, ぶ, ぬ  → 　んだ	  ：読む → 読んだ
          く,ぐ　 → いた,いだ     :	働く→ 働いた, 泳ぐ → 泳いだ
          す → した 	  :　おす→ おした
          *** 行く→行った(irregular)

V2	る　 → 　た     ：食べる → 食べた
Irregular する　→　した, くる → 来た


 */

/**
 * form nakatta 
 * 
 * U-verbs	Stem’s vowel /u/ changes to /a/ to which you add なかった:	話す → 教師と話さなかった
             hiragana う will change う to わ	Ex: 笑う  →  笑わなかった
  Ru-verbs	Attach なかった to the verb stem	食べる → 食事を食べなかった
  Irregular －する	Attach なかった to the verb stem	勉強する → 日本語を勉強しなかった
            －くる	⚠︎ Notice that the stem for くる’s past negative form is こ	くる → 学校にこなかった

 */

/* form te

U-verbs	う,つ,る　 →  って    :吸う → 吸って 
        む, ぶ, ぬ  → 　んで  :読む → 読んで 
        く,ぐ　 → いて,いで  	書く→ 書いて , 泳ぐ → 泳いで 
        す → して	  :　おす→ おして
        
        *** 行く(to go) → 行って（irregular*） 

Ru-verbs	る　 → 　て   : 	食べる → 食べて
Irregular: する　→　 して 、くる → きて

negative

U-verbs	change to negative plain form stem ない, drop the い and add なくて to the stem	話す→ 話さない → 話さなくて 
Ru-verbs	Attach ないで to the stem	食べる → 食べないで
        Note: All verb groups have both ないで (Negative Te form) and ~なくて forms (and the rules are the same for both, per their group).
する	Attach ないで to the stem: 	する → 音をしないでください
くる	Attach ないで to the stem: 
      ⚠︎ Notice that the stem for くる’s negative te-form is こ	くる→ 学校にこないでください


*/

/**
 * 
 * form condition
U-verbs	 う мөр　  → 　え мөр　+　ば    ：	吸う → 吸えば、読めば
ru-verbs	う мөр　  → 　え мөр　+　ば   :食べる → 食べれば
Irregular: する → すれば、くる  → これば


negative

U-verbs	Start from the negative plain form ない, drop the い and add ければ to the verb stem	話す → 話さない → 話さなければ
ru-verbs	Add なければ to the verb stem	食べる → 食べなければ
Irregular: する	Add なければ to the verb stem	勉強する → 勉強しなければ
          くる	Add なければ to the verb stem	くる → こなければ
 */

/*
form tushaah

U-verbs	う мөр　  → 　えмөр　  :	話す→ 話せ
Ru-verbs	う мөр　  → 　おмөр　:	食べる → 食べろ
Irregular: する → しろ、くる → こい


While formal, imperative form なさい still has to be used with care not to offend anyone. 
Verb Group	Rules	Examples

U-verbs	Add なさい to the verb stem	話す→ 話しなさい
Ru-verbs	Add なさい to the verb stem	食べる → 食事を食べなさい
Irregular: する	Add なさい to the verb stem	勉強する → 日本語を勉強しなさい
            くる	Add なさい to the verb stem	くる → 学校にきなさい

*/

/*
form - volitional

Verb Group	Rules	Examples

U-verbs	う мөр　  → 　お　мөр　+ う	  ：教師と話す→ 教師と話そう
Ru-verbs	る　 → 　よう     ：食べる →　食べよう
Irregular: する → しよう、くる→ こよう

Verb Group	Rules	Examples

U-verbs	う мөр　＋　い мөр　+　ましょう   ：	話す→教師と話しましょう
Ru-verbs	る　 → 　ましょう to the verb stem	食べる→一緒に食べましょう
Irregular: する → しましょう
          くる　→ 来ましょう
*/

/*form-potential
U-verbs	う мөр　  → 　えмөр　+ る	    ：話す→ 話せる
Ru-verbs	る　 →  られる  ：食べる → 食べられる
Irregular: する→ できる、 くる→ こられる
*/

/* form - passive


U-verbs	う мөр　 → 　あ мөр　+ れる	：聞く→ 聞かれる 
Ru-verbs	る　 →  られる ：食べる → 食べられた 
Irregular: する → される、くる → こられる
*/

/*form - causative

U-verbs	う мөр　 → 　あ мөр + せる  :話す→ 話させる 
Ru-verbs	る　 →   させる     :食べる → 食べさせる 
Irregular: する → 勉強させる , くる → こさせる

Causative Passive Form
This ultimate form consists of adding the passive form to the causative form of a verb, making it extra long for sure, but not hard to conjugate. The newly created verb belongs to the ru-verb group and can be conjugated with all the other conjugation forms (as long as it sounds logical). 

The action of making someone do, letting someone do or preventing someone to do was done to that person. Because the form is used to express something over which the speaker has no choice or control, the causative passive has a strong negative connotation. It’s conceptually very hard for Romance language speakers to understand, so simply remember that the causative passive form is primarily used with verbs such as “to recall”, “to feel”, “to conceive” or “to think”. 

Japanese Verb Conjugation Chart: Causative Passive Form
Verb Group	Rules	Examples

U-verbs	The stem vowel /u/ becomes /a/, to which you add せられる	思い出す→ 嫌な記憶を思い出させられる I am made to recall a bad memory
Ru-verbs	Add させられる to the verb stem	見せる → 昔の写真を見させられる  I am made to show my old photos
Irregular: する	Add させられる to the verb stem: 	する → 上司に残業させられる I’m made to do overtime by my boss. 
          くる	くる → 休日なのに会社に来させられる  Although it’s a day off, I’m made to go to my company

*/

/*
GODAN EXCEPTION
はいる	to enter
はしる	to run
いる	to need
かえる	to return
かぎる	to limit
きる	to cut
しゃべる	to chatter
しる	to know
つくる	to make*/

List lstGodanEnding = [
  "う",
  "つ",
  "る",
  "む",
  "ぶ",
  "ぬ",
  "く",
  "ぐ",
  "す",
];
// List lstIchidanEnding = ["える", "いる"];
// List lstIrregularEnding = ["する", "くる"];

List lstGodanEndingEn = [
  "u",
];

List lstIrregularGodan = [
  "はいる",
  "はしる",
  "いる",
  "かえる",
  "かぎる",
  "きる",
  "しゃべる",
  "しる",
  "つくる"
];
List lstIchidanEndingEn = ["eru", "iru"];
List lstIrregularEndingEn = ["suru", "kuru"];
