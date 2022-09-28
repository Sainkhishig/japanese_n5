import 'dart:typed_data';

import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/constant_value/common_constants.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/jp_constant/letter/letter_type.dart';
import 'package:excel/excel.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:translit/translit.dart';

import 'letter_game_page_controller.dart';

var kanakit = KanaKit();

class LetterGamePage extends HookConsumerWidget {
  LetterGamePage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(letterGameProvider.notifier);
    // lstN5 = ref.read(n5BoxDataProvider);
    // var lstWord = lstN5.box.values.toList();

    // useEffect(() {
    //   for (var level in [5, 4, 3, 2, 1]) {
    //     listLevel.add(JLPTLevel(level, "N$level"));
    //   }
    // }, const []);
    controller.setModelListenable(ref);
    // // var preferences = ref.read(sharedPreferencesProvider);
    // final future = useMemoized(() => controller.getTableAllocationByDate("5"));
    // final snapshot = useFuture(future, initialData: null);
    // if (snapshot.hasError) {
    //   return showErrorWidget(context, "Error card", snapshot.error);
    // }
    // if (!snapshot.hasData) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    List<Widget> lsttableServings = [];
    for (var element in lstLetters) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Үсэг"),
      // ),
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

  Widget tabCardBody(LetterType currentLetter, context, controller) {
    return Card(
        child: Column(
      children: [
        Text(
          currentLetter.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 5,
                      mainAxisExtent: MediaQuery.of(context).size.height / 12,
                    ),
                    itemCount: currentLetter.lstLetter.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15),
                          //   border: Border.all(
                          //     color: Colors.black,
                          //     width: 1,
                          //   ),
                          // ),
                          child: FlashCard(
                            key: Key(index.toString()),
                            frontWidget: Text(
                              replaceCyrillic(currentLetter.lstLetter[index]),
                              // kanakit.toRomaji(currentLetter.lstLetter[index]),
                              textAlign: TextAlign.center,
                            ),
                            backWidget: Text(
                              currentLetter.lstLetter[index],
                              textAlign: TextAlign.center,
                            ),
                            // width: 50,
                            // height: 50,
                          ));
                    })))
      ],
    ));
  }

  String replaceCyrillic(String word) {
    var letter = trans.unTranslit(source: kanakit.toRomaji(word));
    letter = letter.replaceAll('у', 'ү');
    letter = letter.replaceAll('е', 'э');
    letter = letter.replaceAll('сх', 'ш');
    letter = letter.replaceAll('й', 'ж');
    return letter;
  }
}
