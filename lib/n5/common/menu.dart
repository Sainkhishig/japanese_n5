import 'package:hishig_erdem/n5/reference_n5_learning_pages.dart';
import 'package:flutter/material.dart';

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  late Widget mainPage;
  late Widget gamePage;
  Menu(this.name, this.destination, this.icon, this.mainPage, this.gamePage);
}

late final lstMenu = <Menu>[
  Menu("Үсэг, тоо, ТҮ", "masterData", Icons.format_list_numbered, LetterPage(),
      LetterCardPage()),
  Menu("Ханз, Шинэ үг", "allVocabulary", Icons.border_color,
      VocabularyListPage(), VocabularyCardPage()),
  Menu("Дүрэм", "verbForm", Icons.rule, VerbFormPage(),
      VerbConjugationPracticePage()),
  Menu("Өгүүлбэр зүй", "grammer", Icons.school_rounded, GrammerPage(),
      GrammarCardPage()),
];

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
  Menu("Шинэ үг", "allVocabulary", Icons.ac_unit, VocabularyListPage(),
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
