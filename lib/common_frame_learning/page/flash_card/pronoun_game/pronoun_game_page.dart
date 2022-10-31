import 'package:hishig_erdem/classes/pronoun_type.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_learning/constant_value/common_constants.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'pronoun_game_page_controller.dart';

// import 'letter_card_page_controller.dart';
// import 'letter_type.dart';

class PronounGamePage extends HookConsumerWidget {
  PronounGamePage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(letterGameProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lsttableServings = [];
    for (var element in lstPronoun) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }
    return Scaffold(
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

  Widget tabCardBody(PronounType currentLetter, context, controller) {
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
                      crossAxisCount: 1,
                      mainAxisExtent: MediaQuery.of(context).size.height / 12,
                    ),
                    itemCount: currentLetter.lstLetter.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                          alignment: Alignment.center,
                          child: FlashCard(
                            key: Key(index.toString()),
                            frontWidget: Column(
                              children: [
                                Text(
                                  currentLetter.lstLetter[index].reading,
                                  // kanakit.toRomaji(currentLetter.lstLetter[index]),
                                  textAlign: TextAlign.center,
                                ),
                                Visibility(
                                  visible: controller.isShowPreference,
                                  child: IconButton(
                                    onPressed: () {
                                      speak(
                                        currentLetter.lstLetter[index].reading,
                                      );
                                    },
                                    icon: Icon(Icons.volume_up),
                                  ),
                                )
                              ],
                            ),
                            backWidget: Text(
                              currentLetter.lstLetter[index].meaning,
                              textAlign: TextAlign.center,
                            ),
                            // width: 50,
                            // height: 50,
                          ));
                    })))
      ],
    ));
  }
}
