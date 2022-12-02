import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_dialog.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/save_button.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class CommonTestKanji extends HookConsumerWidget {
  CommonTestKanji({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiTestController.notifier);
    controller.setModelListenable(ref);
    print("build form");
    final future = useMemoized(() => controller.setKanjiList());
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Error card", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    // useEffect(() {
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     controller.setKanjiList();
    //   });
    //   // return controller.dispose;
    // }, const []);

    if (controller.testState.kanjiTestSource.isEmpty) {
      return showEmptyDataWidget();
    }

    KanjiTestModel kanjiTest = controller.state.selectedKanjiTest;
    var jlptLevel = controller.prefs.getInt("jlptLevel");

    bool isChecked = false;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Ханзны тест: N$jlptLevel"),
        // ),
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              kanjiTest.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            StatefulBuilder(builder: (context, setState) {
              return Column(children: [
                Visibility(
                    visible: true, // !isChecked,
                    child: ListView.builder(
                        itemCount: kanjiTest.exercises.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return StatefulBuilder(builder: (context, setState) {
                            var test = kanjiTest.exercises[index];
                            return ListTile(
                              title: Text("${index + 1}. ${test.question}"),
                              subtitle: ListView.builder(
                                  itemCount: test.answers.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var answerItem = test.answers[index];
                                    return RadioListTile(
                                      title: Text(answerItem.answer),
                                      value: answerItem.answer,
                                      groupValue: test.selectedAnswer,
                                      onChanged: (value) {
                                        setState(() {
                                          test.selectedAnswer =
                                              value.toString();
                                          print("radioSelection$value");
                                        });
                                      },
                                    );
                                  }),
                            );
                          });
                        })),
                Visibility(
                  visible: !isChecked,
                  child: SaveButton(
                    label: "Шалгах",
                    onSave: () async {
                      int allCount = kanjiTest.exercises.length;
                      var failedQuestions = kanjiTest.exercises
                          .where((quest) =>
                              quest.answers
                                  .firstWhere((answer) => answer.isTrue)
                                  .answer !=
                              quest.selectedAnswer)
                          .toList();
                      int failedCount = failedQuestions.length;
                      var resultByPercent =
                          (allCount - failedCount) * 100 / allCount;
                      print("percent:$resultByPercent");
                      String emotionMessage =
                          getTestResultForPercent(resultByPercent);

                      await showWarningMessage(context, emotionMessage,
                          "Гүйцэтгэл: $resultByPercent%");
                      await controller.sendTestResult(resultByPercent);
                      setState(() {
                        isChecked = true;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: isChecked,
                  child: Row(
                    children: [
                      Expanded(
                        child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Row(
                              children: const [
                                Expanded(
                                  flex: 2,
                                  child: Text("Тестийн хариу",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            childrenPadding: const EdgeInsets.all(8.0),
                            children: [
                              ListView.builder(
                                  itemCount: kanjiTest.exercises.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      var test = kanjiTest.exercises[index];
                                      var trueAnswer = test.answers.firstWhere(
                                          (answer) => answer.isTrue);
                                      return ListTile(
                                        leading: trueAnswer.answer ==
                                                test.selectedAnswer
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            : const Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                        title: Text(
                                            "${index + 1}. ${test.question}"),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "зөв хариулт: ${trueAnswer.answer}"),
                                            Visibility(
                                              visible: trueAnswer.answer !=
                                                  test.selectedAnswer,
                                              child: Text(
                                                  "таны хариулт:${test.selectedAnswer}"),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                  }),
                            ] // [Text(result.conjugatedVerb), lstWidget],
                            ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isChecked,
                  child: SaveButton(
                    label: "Дараагийн тест ажиллах",
                    onSave: () {
                      for (var exercise in kanjiTest.exercises) {
                        exercise.selectedAnswer = "";
                      }
                      controller.changeTest();
                    },
                  ),
                ),
              ]);
            })
          ]),
    ));
  }
}
