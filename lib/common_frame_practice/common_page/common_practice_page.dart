import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:hishig_erdem/common_frame_learning/page/sample/text_to_speech_sample.dart';
import 'package:hishig_erdem/common_frame_learning/page/sample/tts_sample.dart';
import 'package:hishig_erdem/common_frame_practice/reading/detail/reading_detail.dart';
import 'package:hishig_erdem/common_frame_practice/reading/list/reading_list.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common_page_controller.dart';

class CommonPracticePage extends StatelessWidget {
  const CommonPracticePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);
    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(lstMenu[controller.state.selectedIndex].name),
        actions: [],
      ),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child:
                Center(child: lstMenu[controller.state.selectedIndex].mainPage),
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
  Menu(this.name, this.destination, this.icon, this.mainPage);
}

late final lstMenu = <Menu>[
  // Menu(
  //   "Шинэ үг",
  //   "vocabulary",
  //   Icons.format_list_numbered,
  //   Text("shine uug"),
  // ),
  Menu(
    "Дүрэм",
    "grammar",
    Icons.rule,
    TtsSample(),
  ),
  // Menu("Сонсгол", "verbForm", CupertinoIcons.ear, PlayerPage()),
  Menu("Сонсгол", "verbForm", CupertinoIcons.ear, TextToSpeechSample()),
  Menu(
    "Уншлага",
    "verbForm",
    Icons.menu_book,
    ReadingList(),
  ),
  Menu(
    "Ханз",
    "verbForm",
    CupertinoIcons.pencil_outline,
    ReadingDetail(),
  ),
];
