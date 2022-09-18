import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:afen_vocabulary/card/grammer/grammer_card_page.dart';
import 'package:afen_vocabulary/card/vocabulary_card_page.dart';
import 'package:afen_vocabulary/game/counter/counter_game_page.dart';
import 'package:afen_vocabulary/game/letter_game_page.dart';
import 'package:afen_vocabulary/game/master_data/master_data_game_page.dart';
import 'package:afen_vocabulary/game/pronoun_game/pronoun_game_page.dart';
import 'package:afen_vocabulary/game/verb_form/verb_form_game_page.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/jp_constant/letter/letter_card_page.dart';
import 'package:afen_vocabulary/page/grammer/grammer_page.dart';
import 'package:afen_vocabulary/page/master/counter/counter_page.dart';
import 'package:afen_vocabulary/page/master/number_day/master_data_page.dart';
import 'package:afen_vocabulary/page/master/verbForm/verb_form_page.dart';
import 'package:afen_vocabulary/page/pronoun/pronoun_card_page.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_practice.dart';
import 'package:afen_vocabulary/page/vocabulary/vocabulary_list_page.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_page_controller.dart';

class CommonFrame extends StatelessWidget {
  const CommonFrame({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    lstN5 = ref.read(n5BoxDataProvider);
    // var lstWord = lstN5.box.values.toList();

    // useEffect(() {
    //   for (var level in [5, 4, 3, 2, 1]) {
    //     listLevel.add(JLPTLevel(level, "N$level"));
    //   }
    // }, const []);
    controller.setModelListenable(ref);

var bodyPage =!controller.state.isGameMode
                    ? lstMenu[controller.state.selectedIndex].mainPage
                    : lstMenu[controller.state.selectedIndex]
                        .gamePage;
      if(controller.state.selectedIndex==1){
        var selectedMaster =lstMasterMenu.where((element) => element.destination==controller.state.masterDataDestination).first;
        bodyPage=!controller.state.isGameMode? selectedMaster.mainPage:selectedMaster.gamePage;
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
                  icon: const Icon(Icons.flip)),
              // IconButton(
              //     onPressed: () {
              //       readExcelFile("");
              //     },
              //     icon: const Icon(Icons.download))
            ],
          ),
          Visibility(visible: controller.state.selectedIndex==1,
            child:  Padding(
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
              ))) 
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
            child: Center(
                child: bodyPage
                // !controller.state.isGameMode
                //     ? lstMenu[controller.state.selectedIndex].mainPage
                //     : lstMenu[controller.state.selectedIndex]
                //         .gamePage //Text('Content of Menu ${controller.state.selectedIndex}'),
                ),
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
        // title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //   const Text("システム管理サイト", style: TextStyle(color: Colors.white)),
        //   Text("Ver. ${AppConfig.version}",
        //       style: const TextStyle(color: Colors.white, fontSize: 12)),
        // ]),
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
  //     LetterGamePage()),
  // Menu("Тоо, Гараг, Сар өдөр", "masterData", Icons.dashboard_outlined,
  //     MasterDataPage(), MasterDataGamePage()),
  // Menu("Тоо тоолох нөхцөл", "number", Icons.format_list_numbered, CounterPage(),
  //     CounterGamePage()),
  // Menu("Төлөөний үг", "pronoun", Icons.person_pin_circle_outlined,
  //     PronounCardPage(), PronounGamePage()),
  Menu("Дүрэм", "grammer", Icons.rule, GrammerPage(), GrammarCardPage()),
  Menu("Мастер дата", "masterData", Icons.format_list_numbered, MasterDataPage(), MasterDataGamePage()),
  Menu("Үйл үг", "verbForm", Icons.ac_unit, VerbFormPage(), VerbFormGamePage()),
  Menu("Шинэ үг", "verbForm", Icons.ac_unit, VocabularyListPage(),
      VocabularyCardPage()),
];

late final lstMasterMenu = <Menu>[
  Menu("Үсэг", "letter", Icons.sort_by_alpha, LetterCardPage(),
      LetterGamePage()),
  Menu("Тоо, Гараг, Сар өдөр", "masterDate", Icons.dashboard_outlined,
      MasterDataPage(), MasterDataGamePage()),
  Menu("Тоо тоолох нөхцөл", "masterNumber", Icons.format_list_numbered, CounterPage(),
      CounterGamePage()),
  Menu("Төлөөний үг", "masterPronoun", Icons.person_pin_circle_outlined,
      PronounCardPage(), PronounGamePage()),
];
