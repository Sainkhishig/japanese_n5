import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';

import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hishig_erdem/n5/test/n5_test_frame_page_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

class N5PracticeCommonPage extends HookConsumerWidget {
  //#region ==================== local variable ====================
  String destination;
  late LoginState loginStateNotifier;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  N5PracticeCommonPage({Key? key, required this.destination}) : super(key: key);
  //#endregion ==================== constructor ====================
  late FirebaseAuth? auth;
  //#region ==================== method ====================
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //#region ---------- arrange ----------
    final router = ref.read(mainRouteProvider).router;
    // keycloak = ref.read(keycloakProvider);
    final List<String> _popmenu_list = [
      "Хэрэглэгчийн мэдээлэл",
      "Дасгал ажиллах эрх",
      "Тохиргоо"
    ];
    loginStateNotifier = ref.read(loginStateNotifierProvider.notifier);
    auth = ref.read(firebaseAuthProvider);

    final controller = ref.read(n5testFramePageProvider.notifier);
    controller.setModelListenable(ref);
    final _destinations = practiceMenuN5
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
    final _destinationList = _destinations.toSet().toList();
    //#endregion ---------- arrange ----------

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(practiceMenuN5[controller.railIndex].name),
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
            visible: loginStateNotifier.loggedIn,
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
            icon:
                Icon(loginStateNotifier.loggedIn ? Icons.logout : Icons.login),
            onPressed: () async {
              if (!loginStateNotifier.loggedIn) {
                router.go("/login");
                // loginStateNotifier.notifyListeners();
              } else {
                await auth!.signOut();
                loginStateNotifier.userId = "";
                loginStateNotifier.loggedIn = false;
                loginStateNotifier.notifyListeners();
                // controller.refreshState(loginStateNotifier.userId);
              }
            },
          )
        ],
      ),

      body: getBody(controller),
      // loginStateNotifier.getBody(destination),
      selectedIndex:
          practiceMenuN5.indexWhere((e) => e.destination == destination),
      onDestinationSelected: (value) {
        changeIndex(value, controller, context, router);
      },
      destinations: _destinationList,
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("プラン予約 施設管理サイト", style: TextStyle(color: Colors.white)),
              // Text("Ver. ${AppConfig.version}",
              //     style: const TextStyle(color: Colors.white, fontSize: 12)),
            ]),
      ),
    );
  }

  getBody(N5TestFramePageController controller) {
    var bodyPage = !controller.state.isGameMode
        ? learningMenuN5[controller.state.railIndex].mainPage
        : learningMenuN5[controller.state.railIndex].practicePage;
    if (controller.state.railIndex == 0) {
      var selectedMaster = lstMasterMenu
          .where((element) =>
              element.destination == controller.state.masterDataDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }
    if (controller.state.railIndex == 1) {
      var selectedMaster = lstWordMenu
          .where((element) =>
              element.destination == controller.state.vocabularyMenuDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }
    return bodyPage;
  }

  changeIndex(int index, N5TestFramePageController controller,
      BuildContext context, GoRouter router) async {
    final selectedDestination = practiceMenuN5[index].destination;
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      controller.setRailIndex(index);
      router.go("/n5test/$destination");
    }
    // TODO: URLから取得
  }
  //#region ==================== method ====================
}
