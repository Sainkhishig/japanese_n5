import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/common/common_popup_menu.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/main/main_route.dart';
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

  String destination;
  late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;
  late LoginState loginNotifier;
  late FirebaseAuth? auth;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    loginNotifier = ref.read(loginStateNotifierProvider);
    auth = ref.read(firebaseAuthProvider);
    final router = ref.read(mainRouteProvider).router;
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  router.goNamed("home");
                },
              ),
            ),
            Expanded(
                flex: 9,
                child: Text(
                  learningMenuCommon[loginNotifier.railIndex].name,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
        actions: [
          // ButtonBar(
          //   children: [
          //     IconButton(
          //         onPressed: () {
          //           controller.setSpeechVisible(!controller.state.isShowSpeech);
          //         },
          //         icon: Icon((controller.isShowPreference ?? true)
          //             ? CupertinoIcons.volume_up
          //             : CupertinoIcons.volume_off)),
          //   ],
          // ),
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
              visible: loginNotifier.loggedIn,
              child: commonPopUpMenu(context, ref)),
          IconButton(
            padding: const EdgeInsets.only(bottom: 4),
            disabledColor: Colors.grey,
            // color: Colors.white,
            icon: Icon(loginNotifier.loggedIn ? Icons.logout : Icons.login),
            onPressed: () async {
              if (!loginNotifier.loggedIn) {
                router.go("/login");
                // loginStateNotifier.notifyListeners();
              } else {
                await auth!.signOut();
                loginNotifier.userId = "";
                loginNotifier.loggedIn = false;
                loginNotifier.notifyListeners();
                // controller.refreshState(loginStateNotifier.userId);
              }
            },
          ),
        ],
      ),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: Center(child: getBody(controller)),
          ),
        ],
      )),
      selectedIndex: loginNotifier.railIndex,
      onDestinationSelected: (value) async {
        controller.setGameMode(false);

        // controller.setSelectedIndex(value);
        changeIndex(value, controller, context, router);
      },
      destinations: _buildDestinations2(context, controller),
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        onTap: () {
          router.goNamed("home");
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
            TextButton(
                onPressed: () {
                  // router.goNamed("home");
                },
                child: const Text(
                  "Япон хэлний хичээл",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Text(
              "N${loginNotifier.hiveInfo.jlptLevel} түвшин",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  getBody(CommonPageController controller) {
    var bodyPage = !controller.state.isGameMode
        ? learningMenuCommon[loginNotifier.railIndex].mainPage
        : learningMenuCommon[loginNotifier.railIndex].practicePage;

    return bodyPage;
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

  changeIndex(int index, CommonPageController controller, BuildContext context,
      GoRouter router) async {
    final selectedDestination = learningMenuCommon[index].destination;
    loginNotifier.setRailIndex(index);
    print("indexRail:$index");
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      print("index:$index");
      controller.setGameMode(false);
      router.go("/commonLesson/$selectedDestination");
    }
  }
}
