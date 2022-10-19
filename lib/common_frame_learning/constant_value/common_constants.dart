import 'package:afen_vocabulary/classes/counter_group.dart';
import 'package:afen_vocabulary/classes/grammar.dart';
import 'package:afen_vocabulary/classes/pronoun_type.dart';
import 'package:afen_vocabulary/classes/verb_form.dart';
import 'package:afen_vocabulary/classes/word_group.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constant_counter.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constant_month.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constant_monthday.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constant_number.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constants_katakana.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/constants_weekday.dart';
import 'package:afen_vocabulary/common_frame_learning/page/letter/letter_type.dart';

import 'constant_pronoun.dart';
import 'constant_verb_forms.dart';
import 'constants_hiragana.dart';

var lstLetters = <LetterType>[
  LetterType("Хирагана", constHiraganaBase, "explanation"),
  LetterType("Хирагана (Ондаку)", constHiraganaOndaku, "explanation"),
  LetterType("Хирагана хослол", constHiraganaCombination, "explanation"),
  LetterType("Хирагана хослол (Ондаку)", constHiraganaCombinationOndaku,
      "explanation"),
  LetterType("Катакана", constKatakanaBase, "explanation"),
  LetterType("Катакана (Ондаку)", constKatakanaOndaku, "explanation"),
  LetterType("Катакана хослол", constKatakanaCombination, "explanation"),
  LetterType("Катакана хослол (Ондаку)", constKatakanaCombinationOndaku,
      "explanation"),
];

var lstMasterNumberAndDay = <WordGroup>[
  WordGroup("Тоо", lstNumber, "Хэд?"),
  WordGroup("Гараг", lstWeekDay, "Хэд дэх өдөр вэ?"),
  WordGroup("Сар", lstMonth, "Хэдэн сар вэ?"),
  WordGroup("Өдөр", lstMonthDay, "Хэдний өдөр? Хэдэн өдөр"),
];

var lstVocabulary = <WordGroup>[
  WordGroup("Бүгд", lstNumber, "Хэд?"),
  WordGroup("Тэмдэг нэр", lstWeekDay, "Хэд дэх өдөр вэ?"),
  WordGroup("Дайвар үг", lstMonth, "Хэдэн сар вэ?"),
  WordGroup("Холбоос үг", lstMonthDay, "Хэдний өдөр? Хэдэн өдөр"),
];
var allCounter = [
  lstCounter1,
  lstCounter11,
  lstCounter2,
  lstCounter22,
  lstCounter3,
  lstCounter33
];
var mnCounter = CounterGroup('mn', 'ханз', '', '', counterMn);
var lstCounter1 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('all object', '', 'つ', 'бүх юмс', allObjectCounter),
  CounterGroup('person', '人', 'にん/り', 'хүн', personCounter),
  CounterGroup('animal', '匹', 'ひき', 'жижиг амьтан', animalCounter),
];
var lstCounter11 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('slim thing', '枚', 'まい', 'нимгэн зүйл(цаас)', slimCounter),
  CounterGroup('age', '歳', 'さい', 'нас', ageCounter),
  CounterGroup('floor', '階', 'かい', 'давхар', floorCounter),
];
var lstCounter2 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('small thing', '個', 'こ', 'жижиг зүйл', smallObjectCounter),
  CounterGroup('time', '回', 'かい', 'давтамж', davtamjCounter),
  CounterGroup('long', '本', 'ぼん', 'урт зүйл', longObjectCounter),
];
var lstCounter22 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('book', '冊', 'さつ', 'ном', bookCounter),
  CounterGroup('big object', '台', 'だい', 'том эд зүйл', bigObjectounter),
  CounterGroup('place', 'ヶ所（箇所）', 'かしょ', 'газар, байршил', placeCounter),
];

var lstCounter3 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('hour', '時', 'じ', 'цаг', hourCounter),
  CounterGroup('minut', '分', 'ふん', 'минут', minutCounter),
  CounterGroup('second', '秒', 'びょう', 'секунд', secondCounter),
];
var lstCounter33 = <CounterGroup>[
  CounterGroup('mn', 'ханз', '', '', counterMn),
  CounterGroup('year', '年', 'ねん', 'жил', yearCounter),
  CounterGroup(
      'month duration', '箇月', 'かげつ', 'сарын хугацаа хэлэх', monthDuration),
  CounterGroup(
      'time duration', '時間', 'じかん', 'цагийн хугацаа хэлэх', hourDuratioin),
];

var lstPronoun = <PronounType>[
  PronounType("Биеийн ТҮ(ганц тоо)", pronounSingular, "explanation"),
  PronounType("Биеийн ТҮ(олон тоо)", pronounPlural, "explanation"),
  PronounType("Биеийн ТҮ(ХТЯ)", pronounPossessive, "explanation"),
  PronounType("Биеийн ТҮ(хүч нэмэх)", pronounIntensive, "explanation"),
  PronounType("Асуух ТҮ", pronounInterrogative, "explanation"),
  PronounType("Заах ТҮ", pronounDemonstrative, "explanation"),
  PronounType("Эс тодоройлох ТҮ", pronounDemonstrative, "explanation"),
];

var lstVerbForms = <VerbForm>[
  constDictionaryForm,
  constPoliteForm,
  constConjunctiveForm,
  constTefrom,
  constTaform,
  constNegativeFrom,
  constPastnegative,
  constPassiveForm,
  constCausativeForm,
  constCausativepassive,
  constCommandForm,
  constConditionals,
  constPotentialForm,
  constVolitionalform
];

final lstGrammar = <Grammar>[
  Grammar(
    'だ / です (da / desu)',
    'байна, болно',
    'それは非常に面白いコメントですね。',
    'Энэ их сонирхолтой сэтгэгдэл байна.',
    'sore wa hijou ni omoshiroi komento desu ne.',
  ),
  Grammar(
    'だけ (dake)',
    'зөвхөн,ердөө л, зүгээр л ердөө л, зүгээр л ',
    '私はただ臆測しただけです。',
    'Гэвч би ердөө л таамагасан юм.',
    'watashi wa tada okusoku shita dake desu.',
  ),
  Grammar(
    'だろう (darou)',
    '.. болов уу?',
    'あなたはそれいじょう、お金はいらないだろう。',
    'Чамд тэрнээс их мөнгө хэрэггүй биздээ.',
    'anata wa sore ijou, okane wa iranai darou.',
  ),
  Grammar(
    'で (de) - 1',
    '-д, -т',
    'ここでサッカーをしないでください。',
    'Энд хөл бөмбөг битгий тоглоорой。',
    'koko de sakkaa o shinaide kudasai.',
  ),
  Grammar(
    'で (de) - 2',
    '- аар',
    '震える指で、彼女は封筒を開けた。',
    'Бүсгүй чичирсэн хуруугаараа дугтуйг нээв.',
    'furueru yubi de, kanojo wa fuutou o aketa.',
  ),
  Grammar(
    'でしょう (deshou)',
    '-сэн биздээ, тийм биздээ',
    '宿題は後でできるでしょう。',
    'Гэрийн даалгавраа дараа нь хийж болно биз дээ.',
    'shukudai wa ato de dekiru deshou?',
  ),
  Grammar(
    'が (ga) - 1',
    '... нь',
    '夏が過ぎ、冬がふたたびやって来た。',
    'Зун өнгөрч, дахин өвөл ирлээ.',
    'natsu ga sugi, fuyu ga futatabi yatte kita.',
  ),
  Grammar(
    'が (ga) - 2',
    '... боловч',
    '通路は広かったが真暗だった。',
    'Гудамжууд өргөн боловч харанхуй байв.',
    'tsuuro wa hirokatta ga makkura datta.',
  ),
  Grammar(
    'がある (ga aru)',
    '... байх',
    '言いたいことがありますか？',
    'Танд хэлэх зүйл байна уу?',
    'iitai koto ga arimasu ka.',
  ),
  Grammar(
    'がいる (gairu)',
    '... байх (амьтай зүйл)',
    '図書館に人がいっぱいいる。',
    'Номын сан дүүрэн хүнтэй байна.',
    'toshokan ni hito ga ippai iru.',
  ),
  Grammar(
    'ほうがいい (hou ga ii) - 1',
    '... хэрэгтэй',
    '英会話をもっと練習したほうがいい。',
    'Та англи хэлний яриагаа сайн давтах хэрэгтэй.',
    'eikaiwa o motto renshuu shita hou ga ii.',
  ),
  Grammar(
    'ほうがいい (hou ga ii) - 2',
    '... ёстой',
    '約束を忘れないほうがいい。',
    'Амлалтаа мартахгүй байх ёстой.',
    'yakusoku o wasurenai hou ga ii.',
  ),
  Grammar(
    'いちばん (ichiban)',
    'хамгийн',
    '一番嫌いな男性のタイプは何ですか？',
    'Ямар төрлийн эрчүүдэд хамгийн дургуй вэ?',
    'ichiban kirai na dansei no taipu wa nan desu ka.',
  ),
  Grammar(
    'か (ka) - 1',
    '- уу? - вэ? - бэ?',
    'あなたがだれなのか、どうやってここへ来たのか、誰にもわからない。',
    'Таныг хэн болохыг, яаж энд ирснийг хэн ч мэдэхгүй.',
    'anata ga dare na no ka, dou yatte koko e kita no ka, dare ni mo wakaranai.',
  ),
  Grammar(
    'か (ka) - 2',
    '... эсвэл ...',
    'あの男たちは、佐々木か私を探しているのだ。',
    'Тэр хүмүүс Сасаки эсвэл намайг хайж байна.',
    'ano otokotachi wa, sasaki ka watashi o sagashite iru no da.',
  ),
  Grammar(
    'から (kara) - 1',
    'учир, учраас',
    '財布を忘れたから、電車の切符を買えなかった。',
    'Би түрийвчээ мартсан тул галт тэрэгний билет худалдаж авч чадаагүй.',
    'saifu o wasureta kara, densha no kippu o kaenakatta.',
  ),
  Grammar(
    'から (kara) - 2',
    '-аас',
    '彼はやっと地獄から逃げ出した。',
    'Тэр эцэст нь тамаас зугтсан.',
    'kare wa yatto jigoku kara nigedashita.',
  ),
  Grammar(
    'けど / けれども (kedo / keredomo)',
    'боловч, хэдий ч',
    '千葉君は顔は汚いけど、心はとっても清いんです。',
    'Чиба-кунын царай бохир ч сэтгэл нь маш цэвэрхэн.',
    'chibakun wa kao wa kitanai kedo, kokoro wa tottemo kiyoin desu.',
  ),
  Grammar(
      'くらい / ぐらい (kurai / gurai) - 1',
      '自分の服ぐらい自分で洗ってよ。',
      'Өөрийн хувцасны тухайд (хувцас зэргээ)өөрөө угаа.',
      'jibun no fuku gurai jibun de aratte yo.',
      ""),
  Grammar(
    'まだ (mada)',
    'хараахан, арай',
    'わたしはまだ結婚していません。',
    'Би хараахан гэрлээгүй байна.',
    'watashi wa mada kekkon shite imasen.',
  ),
  Grammar(
    'まで (made)',
    'хүртэл',
    'この話に結着がつくまでお待ちになってください。',
    'Энэ яриа дуусах хүртэл хүлээнэ үү.',
    'kono hanashi wa kecchaku ga tsuku made omachi ni natte kudasai.',
  ),
  Grammar(
    'まえに (mae ni)',
    'өмнө',
    '食事の前に手を洗ってください。',
    'Хоол идэхээсээ өмнө гараа угаана уу.',
    'shokuji no mae ni te o aratte kudasai.',
  ),
  Grammar('ませんか (masen ka)', '私のパーティーに参加しませんか？', 'Миний үдэшлэгт оролцох уу.',
      'watashi no paatii ni sanka shimasen ka.', ""),
  Grammar(
    'ましょう (mashou)',
    '-цгаая/4/',
    'テストを始めましょうか？',
    'Тестээ эхэлцгээх үү?',
    'tesuto o hajimemashou ka.',
  ),
  Grammar(
    'も (mo)',
    '-ч, -ч бас',
    '僕も昨日徹夜で勉強しました。',
    'Би ч бас өчигдөр шөнөжин хичээлээ.',
    'boku mo kinou tetsuya de benkyou shimashita.',
  ),
  Grammar(
    'もう (mou)',
    'аль хэдийнэ, Цаашид',
    'もう我慢できない。',
    'Би цаашид тэвчиж чадахгүй нь.',
    'mou gaman dekinai.',
  ),
  Grammar(
    'な (na)',
    'битгий ～　！',
    '銃を使うな！',
    'Буу битгий ашигла!',
    'juu o tsukau na.',
  ),
  Grammar(
    'ないでください',
    'битгий ～　ээрэй.',
    '宿題をするのを忘れないでください。',
    'Гэрийн даалгавраа хийхээ битгий мартаарай.',
    'Please dont forget to do your homework.',
  ),
  Grammar(
    'なる (naru)',
    'болох',
    '彼女が美しくなりましたね。',
    'Тэр үзэсгэлэнтэй болжээ.',
    'kanojo ga utsukushiku narimashita ne.',
  ),
  Grammar(
    'に (ni)',
    '-д, -т',
    'ここに名前を書いてください。',
    'Энд нэрээ бичнэ үү.',
    'koko ni namae o kaite kudasai.',
  ),
  Grammar(
    'に/へ (ni/e)',
    '-руу',
    'ベッドに戻りたい。',
    'Би орондоо ормоор байна',
    'beddo ni modoritai.',
  ),
  Grammar(
    'にいく (ni iku)',
    '... аар (тулд) явцгаая.',
    '薪を集めに行こう!',
    'Түлээ цуглуулахаар явцгаая.',
    'maki o atsume ni ikou.',
  ),
  Grammar(
    'にする (ni suru)',
    '... гэж шийдэх. (тэгэх, Ингэх Шийдвэр Гаргах)',
    '田舎へは行かないことにしましょうよ。',
    'Хөдөө явахаа больцгооё.',
    'inaka e wa ikanai koto ni shimashou yo.',
  ),
  Grammar(
    'の (no) - 1',
    '-ын, -ийн, -ны, -ний',
    '予定の計画にはなんら変更はありません。',
    'Цагийн төлөвлөгөөнд өөрчлөлт ороогүй байна.',
    'yotei no keikaku ni wa nanra henkou wa arimasen.',
  ),
  Grammar(
    'の (no) – 2',
    '（* үйл үгийг нэр үг болгох нөхцөл）',
    'わたしたちが捕まるのも時間の問題だわ！',
    'Биднийг баригдах нь цаг хугацааны л асуудал!',
    'watashitachi ga tsukamaru no mo jikan no mondai da wa.',
  ),
  Grammar(
    'ので (node)',
    'учраас',
    '少し仮眠を取りますので、状況が変化したら起こしてください。',
    'Би жаахан Нойр Авах тул нөхцөл байдал өөрчлөгдвөл намайг сэрээгээрэй.',
    'sukoshi kamin o torimasu node, joukyou ga henka shitara okoshite kudasai.',
  ),
  Grammar(
    'のがじょうず (no ga jouzu)',
    'ҮҮ-хдээ сайн/чадварлаг.',
    '教えるのが上手な人は、どんな人？',
    'Ямар хүн багшлахдаа сайн бэ?',
    'oshieru no ga jouzu na hito wa, donna hito.',
  ),
  Grammar(
    'のがへた (no ga heta)',
    'ҮҮ-хдээ муу/тааруу.',
    'お酒を飲むのが下手なのです。',
    'Би архи уухад тийм ч сайн биш.',
    'osake o nomu no ga heta na no desu.',
  ),
  Grammar(
    'のがすき (no ga suki)',
    '...нд дутртай',
    '妻は不平を言うのが好き。',
    'Эхнэр маань гомдоллох дуртай.',
    'tsuma wa fuhei o iu no ga suki.',
  ),
  Grammar(
    'すぎる (sugiru)',
    'хэтэрхий ..',
    'この子達にギャンブルは早すぎる。',
    'Эдгээр хүүхдүүдийн хувьд мөрийтэй тоглоом хэтэрхий эрт байна.',
    'kono kodomo ni gyanburu wa hayasugiru.',
  ),
  Grammar(
    'たい (tai)',
    '... мээр байна, -ыг хүсэж байна.',
    'あなたの言うことを聞きたくない。',
    'Би чамайг сонсохыг хүсэхгүй байна.',
    'anata no iu koto o kikitakunai.',
  ),
  Grammar(
    'たことがある (ta koto ga aru)',
    '- ж байсан. - сэн удаа/тохиолдол байгаа.',
    'あの人は誰？何度も見たことがあるよ。',
    'Тэр хүн хэн бэ? Би үүнийг олон удаа харж байсан.',
    'ano hito wa dare. nando mo mita koto ga aru yo.',
  ),
  Grammar(
    'ている (te iru)',
    '-ж байна.',
    '何を考えていますか？',
    'чи юу гэж бодож байна?',
    'nani o kangaete imasu ka.',
  ),
  Grammar(
    'てください (te kudasai)',
    '-аарай, -ээрэй,',
    'ドアをしめてください。',
    'Хаалгаа хаагаарай.',
    'doa o shimete kudasai.',
  ),
  Grammar(
    'てもいい (te mo ii)',
    '- ч болно.',
    'それじゃ、わたし、行ってもいいですか？',
    'За тэгэхээр , би явсан ч болох уу?',
    'Sore ja, watashi, itte mo ii desuka.',
  ),
  Grammar(
    'てから (te kara)',
    '-ны дараа ..., -чихээд',
    'このクラブを出てから兄は行方不明になったんだ！',
    'Ах маань энэ клубээс явснаас хойш сураггүй болсон!',
    'kono kurabu o dete kara ani wa yukuefumei ni nattan da.',
  ),
  Grammar(
    'てはいけない (te wa ikenai)',
    '-ж болохгүй. -х хориотой.',
    'あの男には逆らってはいけないと思う。',
    'Тэр залууг эсэргүүцэж болохгүй гэж бодож байна.',
    'ano otoko ni wa sakaratte wa ikenai to omou.',
  ),
  Grammar(
    'と (to) - 1',
    'болон , ба',
    '若い二人は目と目を見交わした。',
    'Хоёр залуу бие бие рүүгээ харав.',
    'wakai futari wa me to me o mikawashita.',
  ),
  Grammar(
    'つもり (tsumori)',
    '.. бодолтой байна. . ...-ж бодож байна.',
    '国へ帰ったら、会社をつくるつもりだ。',
    'Би эх орондоо очоод компаниа байгуулах бодолтой байгаа.',
    'kuni e kaettara, kaisha o tsukuru tsumori da.',
  ),
  Grammar(
    'や (ya)',
    'болон, ба (Юмсыг тоочих холбоос)',
    '私はずっと、レジャーや観光や旅行にとても関心がありました。',
    'Би үргэлж амралт,үзвэр үйвчилгээ, аялал жуулчлалыг маш их сонирхдог байсан.',
    'watashi wa zutto, rejaa ya kankou ya ryokou ni totemo kanshin ga arimashita.',
  ),
  Grammar(
    'より~ほうが ~ (yori~ hou ga)',
    '.... ээс ... нь дээр.',
    '女より男のほうが飽きやすいものだ。',
    'Эрэгтэйчүүд эмэгтэйчүүдээс илүү амархан уйддаг.',
    'onna yori otoko no hou ga akiyasui mono da.',
  ),
];

class CsvInfo {
  late String name;
  late String csvName;
  late String dbName;
  late String vocType;
  CsvInfo(this.name, this.csvName, this.dbName, this.vocType);
}

final lstCsvDBName = <CsvInfo>[
  CsvInfo("Нэр үг", "wordN5", "N5Words", "noun"),
  CsvInfo("Тэмдэг нэр", "adjectives", "N5Adjective", "adjective"),
  CsvInfo("Үйлт нэр", "csvadverb", "N5Adverb", "adjective"),
  CsvInfo("Холбоос үг", "csvparticle", "N5Particle", "adjective"),
];
