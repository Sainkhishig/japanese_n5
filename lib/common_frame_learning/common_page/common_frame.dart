import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/counter/counter_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/grammer/grammer_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/letter/letter_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/master_data/master_data_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/pronoun_game/pronoun_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/verb_form/verb_form_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/grammer/grammer_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/letter/letter_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/counter/counter_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/number_day/master_data_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/verbForm/verb_form_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/pronoun/pronoun_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/vocabulary/adjective/adjective_list_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/vocabulary/adverb/adverb_vocabulary_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/vocabulary/particle/particle_vocabulary_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/vocabulary/vocabulary_list_page.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

import 'common_page_controller.dart';

class CommonFrameLearning extends StatelessWidget {
  const CommonFrameLearning({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ja', 'JP'),
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ja', 'JP')],
      title: 'Хишиг эрдэм',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // primarySwatch: Colors.blue,
      ),
      home: CommonPage2(),
    );
  }
}

class CommonPage2 extends HookConsumerWidget {
  CommonPage2({Key? key}) : super(key: key);
  late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);

    var bodyPage = !controller.state.isGameMode
        ? lstMenu[controller.state.selectedIndex].mainPage
        : lstMenu[controller.state.selectedIndex].gamePage;
    if (controller.state.selectedIndex == 1) {
      var selectedMaster = lstMasterMenu
          .where((element) =>
              element.destination == controller.state.masterDataDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }
    if (controller.state.selectedIndex == 3) {
      var selectedMaster = lstWordMenu
          .where((element) =>
              element.destination == controller.state.vocabularyMenuDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(lstMenu[controller.state.selectedIndex].name),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () {
                    controller.setGameMode(!controller.state.isGameMode);
                  },
                  icon: Icon(
                    controller.state.isGameMode
                        ? CupertinoIcons.book_circle
                        : CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                  )),
            ],
          ),
          Visibility(
              visible: controller.state.selectedIndex == 1,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton(
                    value: controller.state.masterDataDestination,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    items: lstMasterMenu
                        .map((e) => DropdownMenuItem(
                              value: e.destination,
                              child: Text(e.name),
                            ))
                        .toList(),
                    onChanged: (lvl) async {
                      controller.setMasterDataDestination(lvl as String);
                    },
                  ))),
          Visibility(
              visible: controller.state.selectedIndex == 3,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton(
                    value: controller.state.vocabularyMenuDestination,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    items: lstWordMenu
                        .map((e) => DropdownMenuItem(
                              value: e.destination,
                              child: Text(e.name),
                            ))
                        .toList(),
                    onChanged: (lvl) async {
                      controller.setVocabularyDestination(lvl as String);
                    },
                  ))),
          // Visibility(
          //     visible: controller.state.selectedIndex == 3,
          //     child: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: DropdownButton(
          //           value: controller.state.masterDataDestination,
          //           style: const TextStyle(
          //             fontSize: 14,
          //             color: Colors.black,
          //           ),
          //           items: lstWordMenu
          //               .map((e) => DropdownMenuItem(
          //                     value: e.destination,
          //                     child: Text(e.name),
          //                   ))
          //               .toList(),
          //           onChanged: (lvl) async {
          //             controller.setMasterDataDestination(lvl as String);
          //           },
          //         )))
        ],
      ),
      // navigationTypeResolver: (context) {
      //   if (MediaQuery.of(context).size.width > 1000) {
      //     return NavigationType.permanentDrawer;
      //   } else {
      //     return NavigationType.drawer;
      //   }
      // },

      // appBar: commonAppBar(context, ref, destination),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: Center(child: bodyPage),
          ),
        ],
      )),

      selectedIndex: controller.state.selectedIndex,
      onDestinationSelected: (value) {
        if (value == (lstMenu.length - 1)) {
          controller.setGameMode(!controller.state.isGameMode);
        }
        controller.setSelectedIndex(value);
      },
      destinations: _buildDestinations2(context, controller),
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        onTap: () {
          Navigator.of(context).pop();
        },
        // tileColor: Colors.black,
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              margin: const EdgeInsets.only(bottom: 20),
              constraints: const BoxConstraints.expand(height: 150.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 4.0, color: Colors.amber),
                  bottom: BorderSide(width: 4.0, color: Colors.amber),
                ),
                // color: Colors.blue
              ),
              child: Image.asset(
                "assets/images/logo-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            // const Text("N5"),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(" Флип горим:"),
            //     Switch(
            //       value: controller.state.isGameMode,
            //       onChanged: (value) {
            //         controller.setGameMode(!controller.state.isGameMode);
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPageController controller) {
    return lstMenu
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }
}

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  late Widget mainPage;
  late Widget gamePage;
  Menu(this.name, this.destination, this.icon, this.mainPage, this.gamePage);
}

late final lstMenu = <Menu>[
  // Menu("Үсэг", "letter", Icons.sort_by_alpha, LetterCardPage(),
  //     LetterCardPage()),
  // Menu("Тоо, Гараг, Сар өдөр", "masterData", Icons.dashboard_outlined,
  //     MasterDataPage(), MasterDataGamePage()),
  // Menu("Тоо тоолох нөхцөл", "number", Icons.format_list_numbered, CounterPage(),
  //     CounterGamePage()),
  // Menu("Төлөөний үг", "pronoun", Icons.person_pin_circle_outlined,
  //     PronounCardPage(), PronounGamePage()),
  Menu("Дүрэм", "grammer", Icons.rule, GrammerPage(), GrammarCardPage()),
  Menu("Мастер дата", "masterData", Icons.format_list_numbered, LetterPage(),
      LetterCardPage()),
  Menu("Үйл үг", "verbForm", Icons.ac_unit, VerbFormPage(), VerbFormGamePage()),
  Menu("Шинэ үг", "vocabulary", Icons.ac_unit, VocabularyListPage(),
      VocabularyCardPage()),
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
  Menu("Бүх үг", "allVocabulary", Icons.ac_unit, VocabularyListPage(),
      VocabularyCardPage()),
  Menu("Тэмдэг нэр", "adjectives", Icons.dashboard_outlined,
      AdjectiveListPage(), VocabularyCardPage()),
  Menu("Дайвар үг", "adverb", Icons.dashboard_outlined, AdverbVocabularyPage(),
      VocabularyCardPage()),
  Menu("Холбоос үг", "particle", Icons.dashboard_outlined,
      ParticleVocabularyPage(), VocabularyCardPage()),
];
