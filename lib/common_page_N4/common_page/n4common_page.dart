import 'dart:ui';

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hishig_erdem/authentication/login.dart';
import 'package:hishig_erdem/common_page_N4/page/flash_card/grammer/n4grammer_card_page.dart';
import 'package:hishig_erdem/common_page_N4/page/flash_card/kanji/n4kanji_card_page.dart';
import 'package:hishig_erdem/common_page_N4/page/flash_card/vocabulary/n4vocabulary_card_page.dart';
import 'package:hishig_erdem/common_page_N4/page/grammer/n4grammar_list_page.dart';
import 'package:hishig_erdem/common_page_N4/page/kanji/n4kanji_list_page.dart';
import 'package:hishig_erdem/common_page_N4/page/vocabulary/n4vocabulary_list_page.dart';
import 'package:hishig_erdem/hive_db/provider/n4_box_provider.dart';
// import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
// import 'package:hishig_erdem/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/main/login_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

import 'n4common_page_controller.dart';

class N4CommonPage extends StatelessWidget {
  final String? user_id;
  final FirebaseAuth? auth;

  const N4CommonPage({Key? key, this.user_id, this.auth}) : super(key: key);

  // const CommonFrameLearning({Key? key}) : super(key: key);

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
      home: _CommonPage(
        user_id: user_id,
        auth: auth,
      ),
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}

class _CommonPage extends HookConsumerWidget {
  _CommonPage({Key? key, this.user_id, this.auth}) : super(key: key);
  late String? user_id;
  final FirebaseAuth? auth;
  late N4Box lstN4;
  String? language = 'en-US';
  String? languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lstN5db = ref.read(n4BoxDataProvider);
    final controller = ref.watch(N4CommonPageProvider.notifier);
    var loginNotifier = ref.read(loginStateNotifierProvider);
    final List<String> _popmenu_list = ["Хэрэглэгчийн мэдээлэл", "Тохиргоо"];
    lstN4 = ref.read(n4BoxDataProvider);
    controller.setModelListenable(ref);

    var bodyPage = !controller.state.isGameMode
        ? lstMenu[controller.state.selectedIndex].mainPage
        : lstMenu[controller.state.selectedIndex].gamePage;
    // if (controller.state.selectedIndex == 0) {
    //   var selectedMaster = lstMasterMenu
    //       .where((element) =>
    //           element.destination == controller.state.masterDataDestination)
    //       .first;
    //   bodyPage = !controller.state.isGameMode
    //       ? selectedMaster.mainPage
    //       : selectedMaster.gamePage;
    // }
    // if (controller.state.selectedIndex == 1) {
    //   var selectedMaster = lstWordMenu
    //       .where((element) =>
    //           element.destination == controller.state.vocabularyMenuDestination)
    //       .first;
    //   bodyPage = !controller.state.isGameMode
    //       ? selectedMaster.mainPage
    //       : selectedMaster.gamePage;
    // }

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(lstMenu[controller.state.selectedIndex].name),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () {
                    controller.setSpeechVisible(!controller.state.isShowSpeech);
                  },
                  icon: Icon((controller.isShowPreference ?? true)
                      ? CupertinoIcons.volume_up
                      : CupertinoIcons.volume_off)),
            ],
          ),
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
            visible: user_id != null,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.person),
              onSelected: (String s) async {},
              itemBuilder: (BuildContext context) {
                return _popmenu_list.map((String s) {
                  return PopupMenuItem(
                    child: Text(s),
                    value: s,
                  );
                }).toList();
              },
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(bottom: 4),
            disabledColor: Colors.grey,
            // color: Colors.white,
            icon: Icon(user_id == null ? Icons.login : Icons.logout),
            onPressed: () async {
              if (user_id == null) {
                Navigator.pushNamed(context, "/login");
              } else {
                await auth!.signOut();
                user_id = null;
                controller.refreshState(user_id);
              }
            },
          )
        ],
      ),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: Center(child: bodyPage),
          ),
        ],
      )),
      selectedIndex: controller.state.selectedIndex,
      onDestinationSelected: (value) async {
        controller.setGameMode(false);
        switch (value) {
          case 1:
            // if (value == 1 &&
            //     (lstN5db.box.get("vocabularyDB") == null ||
            //         lstN5db.box.get("vocabularyDB").length == 0)) {
            //   print("prepareVoc$value");
            //   await controller.prepareVocabulary();
            // }
            break;
          default:
        }

        controller.setSelectedIndex(value);
      },
      destinations: _buildDestinations(context, controller),
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        onTap: () {
          Navigator.of(context).pop();
        },
        // tileColor: Colors.black,
        title: Column(
          children: [
            Container(
              // padding: const EdgeInsets.only(bottom: 5),
              // margin: const EdgeInsets.only(bottom: 20),
              constraints:
                  const BoxConstraints.expand(height: 150.0, width: 170),
              // decoration: const BoxDecoration(
              //   border: Border(
              //     top: BorderSide(width: 4.0, color: Colors.amber),
              //     bottom: BorderSide(width: 4.0, color: Colors.amber),
              //   ),
              //   // color: Colors.blue
              // ),
              child: Image.asset(
                "assets/images/logo-shadow.png",
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              "Япон хэлний хичээл",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "N4 түвшин",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  List<AdaptiveScaffoldDestination> _buildDestinations(
      BuildContext context, N4CommonPageController controller) {
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
  Menu("Шинэ үг", "vocabulary", Icons.format_list_numbered,
      N4VocabularyListPage(), N4VocabularyCardPage()),
  Menu("Ханз", "kanji", Icons.border_color, N4KanjiListPage(),
      N4KanjiCardPage()),
  Menu("Өгүүлбэр зүй", "grammar", Icons.school_rounded, N4GrammarListPage(),
      N4GrammarCardPage()),
];

// late final lstMasterMenu = <Menu>[
//   Menu("Үсэг", "letter", Icons.sort_by_alpha, LetterPage(), LetterCardPage()),
//   Menu("Тоо, Гараг, Сар өдөр", "masterDate", Icons.dashboard_outlined,
//       MasterDataPage(), MasterDataGamePage()),
//   Menu("Тоо тоолох нөхцөл", "masterNumber", Icons.format_list_numbered,
//       CounterPage(), CounterGamePage()),
//   Menu("Төлөөний үг", "masterPronoun", Icons.person_pin_circle_outlined,
//       PronounCardPage(), PronounGamePage()),
// ];

// late final lstWordMenu = <Menu>[
//   Menu("Шинэ үг", "allVocabulary", Icons.ac_unit, VocabularyListPage(),
//       VocabularyCardPage()),
//   Menu("Ханз", "kanji", Icons.dashboard_outlined, KanjiListPage(),
//       KanjiCardPage()),
// ];
// late final lstConjugation = <Menu>[
//   Menu("Үйл үг хувиргах", "verbConj", Icons.ac_unit, VocabularyListPage(),
//       VocabularyCardPage()),
//   Menu("Тэмдэг нэр хувиргах", "adjConj", Icons.dashboard_outlined,
//       KanjiListPage(), KanjiCardPage()),
// ];

class AfenUser {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}
