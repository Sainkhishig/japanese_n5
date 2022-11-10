import 'package:flutter/material.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/save_button.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class KanjiTestPage extends HookConsumerWidget {
  KanjiTestPage({Key? key, this.description}) : super(key: key);
  KanjiTestModel? description;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiTestController.notifier);
    controller.setModelListenable(ref);
    // if (description != null) txtName.controller.text = description!.name;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${description!.name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                itemCount: description!.exercises.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return StatefulBuilder(builder: (context, setState) {
                    var test = description!.exercises[index];
                    return ListTile(
                      title: Text("${index + 1}. ${test.question}"),
                      subtitle: ListView.builder(
                          itemCount: test.answers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var answerItem = test.answers[index];
                            return RadioListTile(
                              title: Text(answerItem.answer),
                              value: answerItem.answer,
                              groupValue: test.selectedAnswer,
                              onChanged: (value) {
                                setState(() {
                                  test.selectedAnswer = value.toString();
                                  print("radioSelection$value");
                                });
                              },
                            );
                          }),
                    );
                  });
                }),
            SaveButton(
              onSave: () {
                save(controller);
              },
            )
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
