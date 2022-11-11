import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:hishig_erdem/main/main_route.dart';
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
    router = ref.read(mainRouteProvider).router;
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
                print("level$selectedLevel");
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
                print("level$selectedLevel");
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
          SizedBox(height: 20),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: ElevatedButton(
          //             onPressed: () {
          //               moveLearningCommonPage(
          //                   context, int.parse("$selectedLevel"));
          //             },
          //             child: const Text(
          //               "Хичээл",
          //               style: TextStyle(fontSize: 30),
          //             )),
          //       ),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: ElevatedButton(
          //             onPressed: () {
          //               movePracticeCommonPage(
          //                   context, int.parse("$selectedLevel"));
          //             },
          //             child: const Text(
          //               "Тест",
          //               style: TextStyle(fontSize: 30),
          //             )),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  moveLearningCommonPage(context, int jlptLevel) {
    print("level:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("n5-lesson", params: {"tab": "learnMasterDataN5"});

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
