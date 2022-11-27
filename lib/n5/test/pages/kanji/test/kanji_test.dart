import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/common/common_dialog.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/save_button.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class KanjiTestPage extends HookConsumerWidget {
  KanjiTestPage({Key? key}) : super(key: key);
  // KanjiTestModel? description;
  Random randomVerbToExercise = Random();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiTestController.notifier);
    controller.setModelListenable(ref);

    final future = useMemoized(() => controller.getKanjiTest());
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Error card", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    KanjiTestModel kanjiTest = controller.state.kanjiTestSource[
        randomVerbToExercise.nextInt(controller.state.kanjiTestSource.length)];
    // if (description != null) txtName.controller.text = kanjiTest.name;
    bool isChecked = false;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
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
                    visible: !isChecked,
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
                      await showWarningMessage(context, "Хариу",
                          "$allCountасуултаас $failedCount хариулт буруу");

                      setState(() {
                        isChecked = true;
                      });

                      // save(controller);
                    },
                  ),
                ),
                Visibility(visible: isChecked, child: Text("Тестийн хариу")),
                Visibility(
                  visible: isChecked,
                  child: ListView.builder(
                      itemCount: kanjiTest.exercises.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return StatefulBuilder(builder: (context, setState) {
                          var test = kanjiTest.exercises[index];
                          var trueAnswer = test.answers
                              .firstWhere((answer) => answer.isTrue);
                          return ListTile(
                            leading: trueAnswer.answer == test.selectedAnswer
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                            title: Text("${index + 1}. ${test.question}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("зөв хариулт: ${trueAnswer.answer}"),
                                Visibility(
                                  visible:
                                      trueAnswer.answer != test.selectedAnswer,
                                  child: Text(
                                      "таны хариулт:${test.selectedAnswer}"),
                                )
                              ],
                            ),
                          );
                        });
                      }),
                ),
              ]);
            })
          ]),
    ));
  }

  save(KanjiTestController controller) {
    // var categoryCode = txtCode.controller.text;
    // var categoryName = txtName.controller.text;
    // KanjiTestModel category =
    //     KanjiTestModel(categoryCode, categoryName, DateTime.now());
    // controller.write(category);
  }
}
