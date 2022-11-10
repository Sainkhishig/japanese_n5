import 'package:flutter/material.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/afen_text_field.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/save_button.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class KanjiTest extends HookConsumerWidget {
  KanjiTest({Key? key, this.description = ""}) : super(key: key);
  String description;
  AfenTextField txtCode = AfenTextField("код");
  AfenTextField txtName = AfenTextField("нэр");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiTestController.notifier);
    controller.setModelListenable(ref);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            txtCode,
            txtName,
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
