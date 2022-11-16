import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/common_constant.dart';
import 'package:hishig_erdem/common/loading_button.dart';
import 'package:hishig_erdem/home_screen_controller.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  final String? user_id;
  final FirebaseAuth? auth;

  HomeScreen({Key? key, this.user_id, this.auth}) : super(key: key);

  List<DropdownMenuItem<int>> getDropItems() {
    List<DropdownMenuItem<int>> lstDropItem = [];
    for (var i = 1; i <= 5; i++) {
      lstDropItem.add(DropdownMenuItem<int>(
          alignment: AlignmentDirectional.center,
          value: i,
          child: Text(
            "N$i түвшин",
            textAlign: TextAlign.center,
          )));
    }
    return lstDropItem;
  }

  int selectedLevel = 5;
  late GoRouter router;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginState loginState = ref.read(loginStateNotifierProvider);
    router = ref.read(mainRouteProvider).router;
    var controller = ref.read(homeScreenController.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хишиг эрдэм: Япон хэлний хичээл"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Stack(
                children: [
                  // Text("$title"),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.only(top: 20),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      hint: const Text("сурах түвшингээ сонгоно уу"),
                      isDense: true,
                      items: getDropItems(),
                      value: selectedLevel,
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = int.parse("$value");
                          loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
                        });
                      },
                    )),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        color: Colors.white,
                        child: const Text("Япон хэлний түвшин"),
                      )),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
                moveLearningCommonPage(context, int.parse("$selectedLevel"));
              },
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Хичээл",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
                movePracticeCommonPage(context, int.parse("$selectedLevel"));
              },
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Тест",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          Center(
            child: LoadingButton(
              widgetKey: "kanjiXlLoad",
              onPressed: () {
                controller.loadKanji();
              },
              textLabel: 'kanjiXlLoad',
            ),
          ),
          Center(
            child: LoadingButton(
              widgetKey: "vocabularyXlLoad",
              onPressed: () {
                controller.loadVocabulary();
              },
              textLabel: 'vocabularyXlLoad',
            ),
          ),
          Center(
            child: LoadingButton(
              widgetKey: "grammarXlLoad",
              onPressed: () {
                controller.loadGrammar();
              },
              textLabel: 'grammarXlLoad',
            ),
          ),
        ],
      ),
    );
  }

  moveLearningCommonPage(context, int jlptLevel) {
    print("level:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("n5-lesson",
            params: {"tab": learningMenuN5[0].destination});

        break;
      // case 4:
      //   break;
      // case 3:
      //   break;
      // case 2:
      //   break;
      // case 1:
      //   break;
      default:
        router.goNamed("common-lesson",
            params: {"tab": learningMenuCommon[0].destination});
        break;
    }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => commonPage));
  }

  movePracticeCommonPage(context, int jlptLevel) {
    print("level:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("n5-test", params: {"tab": "testVocabularyN5"});
        break;
      case 4:
        break;
      case 3:
        break;
      case 2:
        break;
      case 1:
        break;
      default:
    }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => commonPage));
  }
}
