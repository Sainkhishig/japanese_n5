import 'package:afen_vocabulary/classes/jlpt_level.dart';
import 'package:afen_vocabulary/common/app_function.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'vocabulary_card_page_controller.dart';

class VocabularyCardPage extends HookConsumerWidget {
  VocabularyCardPage({Key? key}) : super(key: key);
  late List<JLPTLevel> listLevel = [];
  late List<String> listInterval = [];
  late N5Box lstN5;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    var lstN5db = ref.read(n5BoxDataProvider);
    var lstVocabul = lstN5db.box.get("N5Words");
    final controller = ref.watch(vocabularyCardProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lsttableServings = [];
    if (lstVocabul != null) {
      var sectionCount = (lstVocabul.length / 10).ceil();
      listLevel = [];
      for (var i = 1; i <= sectionCount; i++) {
        listLevel.add(JLPTLevel(i, "x - $i"));
      }
      var lstVocDataRange = lstVocabul.getRange(
          (controller.state.jlptLevel - 1), lstVocabul.length - 1);
      for (var element in lstVocDataRange) {
        lsttableServings.add(tabCardBody(element, context, controller));
      }
    }
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Vocabulary"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton(
                value: controller.state.jlptLevel,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                items: listLevel
                    .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                        ))
                    .toList(),
                onChanged: (lvl) async {
                  controller.setLevel(lvl as int);
                },
              ))
        ],
      ),
      body: Scaffold(
        body: lsttableServings.isEmpty
            ? showEmptyDataWidget()
            : //Expanded(child: FlashCardListItem(flashcards: flashCard)),

            PageView(
                controller: pageController,
                children: lsttableServings,
                onPageChanged: (value) {
                  controller.setSelectedIndex(value);
                },
              ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                if (pageController.page!.toInt() > 0) {
                  controller.setSelectedIndex(pageController.page!.toInt() - 1);
                  pageController.animateToPage(pageController.page!.toInt() - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(lsttableServings.isEmpty
                    ? " 0/0"
                    : " ${controller.state.selectedCardIndex}/${lsttableServings.length}")),
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                if (pageController.page!.toInt() + 1 <
                    lsttableServings.length) {
                  controller.setSelectedIndex(pageController.page!.toInt() + 1);
                  pageController.animateToPage(pageController.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                } else if (pageController.page!.toInt() != 0) {
                  controller.setSelectedIndex(0);
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget tabCardBody(dynamic currentWord, context, controller) {
    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 100,
            frontWidget: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                        child: Text(
                  currentWord.translate,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ))),

                TextButton.icon(
                  onPressed: () {
                    speak(currentWord.exampleTr);
                  },
                  icon: const Icon(Icons.volume_up),
                  label: Text(currentWord.exampleTr),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [

                //     IconButton(
                //       onPressed: () {
                //         speak(currentWord.exampleTr);
                //       },
                //       icon: Icon(Icons.volume_up),
                //     ),
                //     Expanded(child: Text(currentWord.exampleTr))
                //   ],
                // ),
                Expanded(flex: 1, child: Text(currentWord.example))
              ],
            )),
            backWidget: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  currentWord.word,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
                IconButton(
                  onPressed: () {
                    speak(currentWord.word);
                  },
                  iconSize: 50,
                  icon: Icon(Icons.volume_up),
                ),
              ],
            ))));
  }
}
