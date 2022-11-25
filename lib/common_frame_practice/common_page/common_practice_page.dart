import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/common/menu.dart';

import 'package:flutter/material.dart';

import 'package:adaptive_navigation/adaptive_navigation.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_page_controller.dart';

class CommonPagePractice extends HookConsumerWidget {
  CommonPagePractice({Key? key, required this.destination}) : super(key: key);

  String destination;
  late N5Box lstN5;
  String? language = 'en-US';
  String? languageCode;
  late LoginState loginNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPracticePageProvider.notifier);
    loginNotifier = ref.read(loginStateNotifierProvider);
    final router = ref.read(mainRouteProvider).router;
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);

    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(practiceMenuCommon[controller.state.selectedIndex].name),
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
              constraints:
                  const BoxConstraints.expand(height: 150.0, width: 170),
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

  getBody(CommonPracticePageController controller) {
    var bodyPage = !controller.state.isGameMode
        ? practiceMenuCommon[loginNotifier.railIndex].mainPage
        : practiceMenuCommon[loginNotifier.railIndex].practicePage;

    return bodyPage;
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPracticePageController controller) {
    return practiceMenuCommon
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }

  changeIndex(int index, CommonPracticePageController controller,
      BuildContext context, GoRouter router) async {
    final selectedDestination = practiceMenuCommon[index].destination;
    loginNotifier.setRailIndex(index);
    print("indexRail:$index");
    if (selectedDestination == "logout") {
      // loginStateNotifier.logOut();
    } else {
      destination = selectedDestination;
      print("index:$index");
      controller.setGameMode(false);
      router.go("/test/$selectedDestination");
    }
  }
}
