import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hishig_erdem/n5/reference_n5_learning_pages.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:hishig_erdem/authentication/login.dart';
import 'package:hishig_erdem/fee/plan_fee.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/n5/reference_n5_learning_pages.dart';
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
      title: 'Хишиг эрдэмs',
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
        '/planFee': (context) => PlanFee(),
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
    var lstN5db = ref.read(n5BoxDataProvider);
    final controller = ref.watch(commonPageProvider.notifier);
    var loginNotifier = ref.read(loginStateNotifierProvider);
    final List<String> _popmenu_list = [
      "Хэрэглэгчийн мэдээлэлx",
      "Дасгал ажиллах эрх",
      "Тохиргоо"
    ];
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);

    var bodyPage = !controller.state.isGameMode
        ? learningMenuN5[controller.state.selectedIndex].mainPage
        : learningMenuN5[controller.state.selectedIndex].practicePage;
    if (controller.state.selectedIndex == 0) {
      var selectedMaster = lstMasterMenu
          .where((element) =>
              element.destination == controller.state.masterDataDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }
    if (controller.state.selectedIndex == 1) {
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
        title: Text(learningMenuN5[controller.state.selectedIndex].name),
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
              visible: controller.state.selectedIndex == 0,
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
              visible: controller.state.selectedIndex == 1,
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
            visible: user_id == null,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.person),
              onSelected: (String popMenu) async {
                switch (popMenu) {
                  case "Дасгал ажиллах эрх":
                    Navigator.pushNamed(context, "/planFee");
                    break;
                  default:
                }
              },
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
            if (value == 1 &&
                (lstN5db.box.get("vocabularyDB") == null ||
                    lstN5db.box.get("vocabularyDB").length == 0)) {
              print("prepareVoc$value");
              await controller.prepareVocabulary();
            }
            break;
          default:
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
              "N5 түвшин",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPageController controller) {
    return learningMenuN5
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }
}
