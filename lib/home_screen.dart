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
            "$i",
            textAlign: TextAlign.center,
          )));
    }
    return lstDropItem;
  }

  Object? selectedLevel;
  late GoRouter router;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var itemSource = getDropItems();
    router = ref.read(mainRouteProvider).router;

    var hasSelectedValue = selectedLevel == null
        ? true
        : itemSource.any((element) => element.value == selectedLevel);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хишиг эрдэм: Япон хэлний хичээл"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Stack(
                children: [
                  // Text("$title"),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(top: 20),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      hint: const Text("сурах түвшингээ сонгоно уу"),
                      isDense: true,
                      items: getDropItems(),
                      value: hasSelectedValue ? selectedLevel : null,
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        moveCommonPage(context, int.parse("$selectedLevel"));
                      },
                      child: const Text(
                        "Хичээл",
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  moveCommonPage(context, int jlptLevel) {
    print("level:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("n5-root", params: {"tab": "masterData"});
        // router. ("n5-root", params: {"tab": "masterData"});
        // print("case:5");
        // commonPage = CommonFrameLearning(
        //   user_id: user_id,
        //   auth: auth,
        // );
        break;
      case 4:
        router.goNamed("n5-root", params: {"tab": "allVocabulary"});
        // print("case:4");
        // commonPage = N4CommonPage(
        //   user_id: user_id,
        //   auth: auth,
        // );
        break;
      case 3:
        // print("case:3");
        // commonPage = CommonFrameLearning(
        //   user_id: user_id,
        //   auth: auth,
        // );
        break;
      case 2:
        // commonPage = CommonFrameLearning(
        //   user_id: user_id,
        //   auth: auth,
        // );
        break;
      case 1:
        // commonPage = CommonFrameLearning(
        //   user_id: user_id,
        //   auth: auth,
        // );
        break;
      default:
    }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => commonPage));
  }
}
