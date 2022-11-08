import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/common_frame_learning/common_page/common_frame.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';

import 'package:hishig_erdem/main/n5_common_page_controller.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

class N5CommonPage extends HookConsumerWidget {
  //#region ==================== local variable ====================
  String destination;
  late LoginState loginStateNotifier;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  N5CommonPage({Key? key, required this.destination}) : super(key: key);
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

    final controller = ref.read(n5commonPageProvider.notifier);
    controller.setModelListenable(ref);
    final _destinations = loginStateNotifier.lstMenuWithPage
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
    final _destinationList = _destinations.toSet().toList();
    //#endregion ---------- arrange ----------

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(loginStateNotifier
            .lstMenuWithPage[controller.state.selectedIndex].name),
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

      body: controller.state.isGameMode
          ? loginStateNotifier.lstMenuWithPage
              .firstWhere((element) => element.destination == destination)
              .practicePage
          : loginStateNotifier.lstMenuWithPage
              .firstWhere((element) => element.destination == destination)
              .mainPage,
      // loginStateNotifier.getBody(destination),
      selectedIndex: controller.railIndex == 0
          ? loginStateNotifier.lstMenuWithPage
              .indexWhere((e) => e.destination == destination)
          : controller.railIndex,
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

  changeIndex(int index, N5CommonPageController controller,
      BuildContext context, GoRouter router) async {
    final selectedDestination =
        loginStateNotifier.lstMenuWithPage[index].destination;
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      controller.setRailIndex(index);
      router.go("/n5/$destination");
    }
    // TODO: URLから取得
  }
  //#region ==================== method ====================
}
