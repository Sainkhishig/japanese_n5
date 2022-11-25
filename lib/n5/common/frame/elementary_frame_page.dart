import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/common/common_popup_menu.dart';

import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';

import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/common/frame/elementary_frame_page_controller.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';

class ElementaryFramePage extends HookConsumerWidget {
  //#region ==================== local variable ====================
  String destination;
  late LoginState loginStateNotifier;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  ElementaryFramePage({Key? key, required this.destination}) : super(key: key);
  //#endregion ==================== constructor ====================
  late FirebaseAuth? auth;
  //#region ==================== method ====================
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("destination33$destination");
    //#region ---------- arrange ----------
    final router = ref.read(mainRouteProvider).router;
    // keycloak = ref.read(keycloakProvider);

    loginStateNotifier = ref.read(loginStateNotifierProvider.notifier);
    auth = ref.read(firebaseAuthProvider);

    final controller = ref.read(elementaryFramePageProvider.notifier);
    controller.setModelListenable(ref);
    final _destinations = elementaryLessonMenu
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
    final _destinationList = _destinations.toSet().toList();
    //#endregion ---------- arrange ----------

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(elementaryLessonMenu[controller.railIndex].name),
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
              visible: destination == 'masterData',
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
              visible: loginStateNotifier.loggedIn,
              child: commonPopUpMenu(context, ref)),
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
      // controller.state.isGameMode
      //     ? loginStateNotifier.lstMenuWithPage
      //         .firstWhere((element) => element.destination == destination)
      //         .practicePage
      //     : loginStateNotifier.lstMenuWithPage
      //         .firstWhere((element) => element.destination == destination)
      //         .mainPage,
      // loginStateNotifier.getBody(destination),
      selectedIndex:
          elementaryLessonMenu.indexWhere((e) => e.destination == destination),
      onDestinationSelected: (value) async {
        print("indexRail0:$value");
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

        // controller.setSelectedIndex(value);

        // loginStateNotifier.setRailIndex(value);
        changeIndex(value, controller, context, router);
      },

      destinations: _destinationList,
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
              "Анхан шат(суурь мэдлэг)",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  getBody(ElementaryFramePageController controller) {
    var bodyPage = !controller.state.isGameMode
        ? elementaryLessonMenu[controller.state.railIndex].mainPage
        : elementaryLessonMenu[controller.state.railIndex].practicePage;
    if (controller.state.railIndex == 0) {
      var selectedMaster = lstMasterMenu
          .where((element) =>
              element.destination == controller.state.masterDataDestination)
          .first;
      bodyPage = !controller.state.isGameMode
          ? selectedMaster.mainPage
          : selectedMaster.gamePage;
    }
    return bodyPage;
  }

  changeIndex(int index, ElementaryFramePageController controller,
      BuildContext context, GoRouter router) async {
    final selectedDestination = elementaryLessonMenu[index].destination;
    loginStateNotifier.setRailIndex(index);
    print("indexRail:$index");
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      print("index:$index");
      controller.setGameMode(false);
      controller.setRailIndex(index);

      router.go("/japanese/$destination");
    }
    // TODO: URLから取得
  }
  //#region ==================== method ====================
}
