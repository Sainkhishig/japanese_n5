import 'package:afen_vocabulary/common/common_frame_practice/common_widget/afen_text_field.dart';
import 'package:afen_vocabulary/common/common_frame_practice/common_widget/save_button.dart';
import 'package:afen_vocabulary/common/common_frame_practice/common_widget/text_list.dart';
import 'package:afen_vocabulary/common/common_frame_practice/reading/detail/reading_detail_controller.dart';
import 'package:afen_vocabulary/common/common_frame_practice/reading/model/reading_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class ReadingDetail extends HookConsumerWidget {
  ReadingDetail({Key? key}) : super(key: key);
  AfenTextField txtContent = AfenTextField("эх");
  AfenTextField txtQuestion = AfenTextField("асуулт");
  AfenTextField txtAnswer = AfenTextField("хариу");
  TextAddList answerController = TextAddList(
      onClickAdd: () {
        return ImageItem(AfenTextField("Хариулт"), Key("1"));
      },
      lstDragItems: [ImageItem(AfenTextField("Хариулт"), Key("2"))]);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(readingDetailController.notifier);
    controller.setModelListenable(ref);

    return Scaffold(
      body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(children: [
        txtContent,
        txtQuestion,
        txtAnswer,
        answerController,
        SaveButton(
          onSave: () {
            save(controller);
          },
        )
      ]),
    );
  }

  save(ReadingDetailController controller) {
    var content = txtContent.controller.text;
    var question = txtQuestion.controller.text;
    var answer = txtAnswer.controller.text;
    var answers = answerController.lstDragItems
        .map((e) => e.field.controller.text)
        .toList();
    ReadingModel reading =
        ReadingModel(content, question, answers, answer, DateTime.now());
    controller.write(reading);
  }
}
