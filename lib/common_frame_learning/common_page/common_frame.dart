import 'package:hishig_erdem/n5/common/menu.dart';

import 'package:flutter/material.dart';

import 'package:adaptive_navigation/adaptive_navigation.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

import 'common_page_controller.dart';

class CommonFrameLearning extends HookConsumerWidget {
  CommonFrameLearning({Key? key, required this.destination}) : super(key: key);

  final String destination;
  late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    var loginNotifier = ref.read(loginStateNotifierProvider);

    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);

    var bodyPage = !controller.state.isGameMode
        ? learningMenuCommon[controller.state.selectedIndex].mainPage
        : learningMenuCommon[controller.state.selectedIndex].practicePage;

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(learningMenuCommon[controller.state.selectedIndex].name),
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
            Text(
              "${loginNotifier.hiveInfo.jlptLevel} түвшин",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPageController controller) {
    return learningMenuCommon
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }
}
