import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:afen_vocabulary/authentication/login.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/counter/counter_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/grammer/grammer_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/kanji/kanji_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/letter/letter_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/master_data/master_data_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/pronoun_game/pronoun_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/verb_form/verb_form_game_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/all/vocabulary_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/grammer/grammer_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/kanji/kanji_list_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/letter/letter_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/counter/counter_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/number_day/master_data_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/master/verbForm/verb_form_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/pronoun/pronoun_card_page.dart';
import 'package:afen_vocabulary/common_frame_learning/page/vocabulary/vocabulary_list_page.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

import 'common_page_controller.dart';

class CommonFrameLearning extends StatelessWidget {
  final String? user_id;
  final FirebaseAuth? auth;

  const CommonFrameLearning({Key? key, this.user_id, this.auth})
      : super(key: key);

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
      home: CommonLearningPage(
        user_id: user_id,
        auth: auth,
      ),
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}

class CommonLearningPage extends HookConsumerWidget {
  CommonLearningPage({Key? key, this.user_id, this.auth}) : super(key: key);
  late String? user_id;
  final FirebaseAuth? auth;
  late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    var loginNotifier = ref.read(loginStateNotifierProvider);
    final List<String> _popmenu_list = ["Хэрэглэгчийн мэдээлэл", "Тохиргоо"];
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
            icon: Icon(user_id == null ? Icons.logout : Icons.login),
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
  Menu("Үсэг, тоо, ТҮ", "masterData", Icons.format_list_numbered, LetterPage(),
      LetterCardPage()),
  Menu("Ханз, Шинэ үг", "vocabulary", Icons.rule, VocabularyListPage(),
      VocabularyCardPage()),
  Menu("Дүрэм", "verbForm", Icons.border_color, VerbFormPage(),
      VerbFormGamePage()),
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

class AfenUser {
  late String userName;
  late String uuid;
  late String password;
  late String birthday;
}

// class AppSetting {
//   late String userName;
//   late String uuid;
//   late String password;
//   late String birthday;
// }
