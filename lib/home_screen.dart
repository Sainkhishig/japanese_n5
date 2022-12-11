import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/common_dialog.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
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
    for (var i = 0; i <= 5; i++) {
      lstDropItem.add(DropdownMenuItem<int>(
          alignment: AlignmentDirectional.center,
          value: i,
          child: Text(
            i == 0 ? "Анхан шат" : "N$i түвшин",
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
    selectedLevel = loginState.hiveInfo.jlptLevel;
    var pref = ref.read(sharedPreferencesProvider);

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
                      value: loginState.hiveInfo.jlptLevel,
                      onChanged: (value) {
                        setState(() async {
                          selectedLevel = int.parse("$value");
                          await pref.setInt("jlptLevel", selectedLevel);
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
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       router.goNamed("elementary-lesson",
          //           params: {"tab": elementaryLessonMenu[0].destination});
          //     },
          //     child: const SizedBox(
          //         width: 120,
          //         child: Text(
          //           "Үндсэн хичээл",
          //           textAlign: TextAlign.center,
          //           style: TextStyle(fontSize: 30),
          //         )),
          //   ),
          // ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (selectedLevel == 0) {
                  router.goNamed("elementary-lesson",
                      params: {"tab": elementaryLessonMenu[0].destination});
                } else {
                  if (selectedLevel == 3 ||
                      selectedLevel == 2 ||
                      selectedLevel == 1) {
                    showWarningMessage(context, "JLPT хичээл",
                        "Уучлаарай одоогоор N3-N1 түвшний хичээл ороогүй байна.");
                  } else {
                    moveLearningCommonPage(
                        context, int.parse("$selectedLevel"));
                  }
                }
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
                if (selectedLevel == 0) {
                  router.goNamed("elementary-lesson",
                      params: {"tab": elementaryLessonMenu[0].destination});
                } else {
                  movePracticeCommonPage(context, int.parse("$selectedLevel"));
                }
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
          const SizedBox(height: 20),
          Visibility(
            visible: loginState.userName == "ari.ariuka67@gmail.com",
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  router.goNamed("adminConfirmationPage");
                },
                child: const SizedBox(
                    width: 120,
                    child: Text(
                      "Админ№",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    )),
              ),
            ),
          )

          // MediaUploader(),
          // Center(
          //   child: LoadingButton(
          //     widgetKey: "readListeningPath",
          //     onPressed: () {},
          //     textLabel: 'readListeningPath',
          //   ),
          // ),
        ],
      ),
    );
  }

  // Future fileSelect() async {
  //   FilePickerResult? image = await FilePicker.platform.pickFiles(
  //     allowMultiple: true,
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png', 'mp3'],
  //   );
  //   if (image != null) {
  //     var duplicateFilter = image.files.where((e) {
  //       return !_pickedImages.map((y) => y!.name).toList().contains(e.name);
  //     }).toList();

  //     for (var e in duplicateFilter) {
  //       _pickedImages.add(e);
  //     }

  //     if (mounted) {
  //       setState(() {});
  //     }
  //   } else {
  //     print("File picker error");
  //   }
  // }

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
    print("testlevel:$jlptLevel");
    switch (jlptLevel) {
      case 5:
        router.goNamed("common-test",
            params: {"tab": practiceMenuCommon[0].destination});
        // router
        //     .goNamed("n5-test", params: {"tab": practiceMenuN5[0].destination});
        break;
      case 4:
        router.goNamed("common-test",
            params: {"tab": practiceMenuCommon[0].destination});
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
