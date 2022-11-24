import 'package:hishig_erdem/common_frame_learning/page/flash_card/grammer/common_grammer_card_page.dart';
import 'package:hishig_erdem/common_frame_learning/page/flash_card/kanji/common_kanji_card_page.dart';
import 'package:hishig_erdem/common_frame_learning/page/flash_card/vocabulary/common_vocabulary_card_page.dart';
import 'package:hishig_erdem/common_frame_learning/page/grammer/common_grammer_page.dart';
import 'package:hishig_erdem/common_frame_learning/page/kanji/common_kanji_list_page.dart';
import 'package:hishig_erdem/common_frame_learning/page/vocabulary/common_vocabulary_list_page.dart';
import 'package:hishig_erdem/common_frame_practice/listening/player/sample/player_page.dart';
import 'package:hishig_erdem/n5/reference_n5_learning_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_list.dart';
import 'package:hishig_erdem/n5/test/pages/listening/listening_test_list.dart';

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  late Widget mainPage;
  late Widget gamePage;
  Menu(this.name, this.destination, this.icon, this.mainPage, this.gamePage);
}

late final learningMenuCommon = <MenuPage>[
  MenuPage("Ханз", "kanji", Icons.format_list_numbered, CommonKanjiListPage(),
      CommonKanjiCardPage()),
  MenuPage("Шинэ үг", "vocabulary", Icons.border_color,
      CommonVocabularyListPage(), CommonVocabularyCardPage()),
  MenuPage("Өгүүлбэр зүй", "grammar", Icons.school_rounded, CommonGrammerPage(),
      CommonGrammarCardPage()),
  MenuPage(
      "Сонсгол", "conjugation", CupertinoIcons.ear, PlayerPage(), PlayerPage()),
];

late final learningMenuN5 = <MenuPage>[
  MenuPage("Үсэг, тоо, ТҮ", "learnMasterDataN5", Icons.format_list_numbered,
      LetterPage(), LetterCardPage()),
  MenuPage("Ханз, Шинэ үг", "learnKanjiVocabularyN5", Icons.border_color,
      VocabularyListPage(), VocabularyCardPage()),
  MenuPage("Дүрэм", "learnVerbAdjN5", Icons.rule, VerbFormPage(),
      VerbConjugationPracticePage()),
  MenuPage("Өгүүлбэр зүй", "learnGrammerN5", Icons.school_rounded,
      GrammerPage(), GrammarCardPage()),
];

late final practiceMenuN5 = <MenuPage>[
  MenuPage("Шинэ үг", "testVocabularyN5", Icons.format_list_numbered,
      LetterPage(), LetterCardPage()),
  MenuPage("Ханз", "testKanjiN5", CupertinoIcons.pencil_outline,
      KanjiTestList(), KanjiTestList()),
  MenuPage("Өгүүлбэр зүй", "testGrammarN5", Icons.rule, VerbFormPage(),
      VerbConjugationPracticePage()),
  MenuPage("Уншлага", "testReadingN5", Icons.menu_book, KanjiTestList(),
      KanjiTestList()),
  MenuPage("Сонсгол", "testListening", CupertinoIcons.ear, ListeningTestList(),
      ListeningTestList()),
];

class MenuPage {
  late String name;
  late String destination;
  late IconData icon;
  late dynamic mainPage;
  late dynamic practicePage;
  MenuPage(
      this.name, this.destination, this.icon, this.mainPage, this.practicePage);
}

// late final learningMenuN5 = <Menu>[
//   Menu("Үсэг, тоо, ТҮ", "masterData", Icons.format_list_numbered, LetterPage(),
//       LetterCardPage()),
//   Menu("Ханз, Шинэ үг", "allVocabulary", Icons.border_color,
//       VocabularyListPage(), VocabularyCardPage()),
//   Menu("Дүрэм", "verbForm", Icons.rule, VerbFormPage(),
//       VerbConjugationPracticePage()),
//   Menu("Өгүүлбэр зүй", "grammer", Icons.school_rounded, GrammerPage(),
//       GrammarCardPage()),
// ];

late final lstMasterMenu = <Menu>[
  Menu("Үсэг", "letter", Icons.sort_by_alpha, LetterPage(), LetterCardPage()),
  Menu("Тоо, Гараг, Сар өдөр", "masterDate", Icons.dashboard_outlined,
      MasterDataPage(), MasterDataGamePage()),
  Menu("Тоо тоолох нөхцөл", "masterNumber", Icons.format_list_numbered,
      CounterPage(), CounterGamePage()),
  Menu("Төлөөний үг", "masterPronoun", Icons.person_pin_circle_outlined,
      PronounCardPage(), PronounGamePage()),
];

late final lstWordMenu = <Menu>[
  Menu("Шинэ үг", "vocabularyN5", Icons.ac_unit, VocabularyListPage(),
      VocabularyCardPage()),
  Menu("Ханз", "kanji", Icons.dashboard_outlined, KanjiListPage(),
      KanjiCardPage()),
];

late final lstConjugation = <Menu>[
  Menu("Үйл үг хувиргах", "verbConj", Icons.ac_unit, VocabularyListPage(),
      VocabularyCardPage()),
  Menu("Тэмдэг нэр хувиргах", "adjConj", Icons.dashboard_outlined,
      KanjiListPage(), KanjiCardPage()),
];

class AfenUser {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}

class AppSetting {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}
