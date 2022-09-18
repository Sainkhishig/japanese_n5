import 'package:afen_vocabulary/classes/jlpt_level.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/constant_value/common_constants.dart';
import 'package:afen_vocabulary/game/letter_game_page.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/import/import_vocabulary_page.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'letter_card_page_controller.dart';
import 'letter_type.dart';

class LetterCardPage extends HookConsumerWidget {
  LetterCardPage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(letterCardProvider.notifier);
    controller.setModelListenable(ref);
    List<Widget> lsttableServings = [];
    for (var element in lstLetters) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Япон үсэг"),
      // ),
      body: Scaffold(
        body: lsttableServings.isEmpty
            ? showEmptyDataWidget()
            : PageView(
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
                    : " ${controller.state.selectedCardIndex + 1}/${lsttableServings.length}")),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentLetter.lstLetter[index],
                            ),
                            Text(
                                "(${trans.unTranslit(source: kanakit.toRomaji(currentLetter.lstLetter[index]))})"
                                    .replaceAll('у', 'ү')),

                            // trans.unTranslit(source: 'Privet mir');
                            // Text(
                            //     "(${kanakit.toRomaji(currentLetter.lstLetter[index])})")
                          ],
                        ),
                      );
                    })))
      ],
    ));

    // Center(
    //   child: Card(
    //     elevation: 4.0,
    //     child: Column(
    //       children: [
    //         Text(currentLetter.name),
    //         Expanded(
    //             flex: 3,
    //             child: Center(
    //               child: GridView.builder(
    //                 itemCount: currentLetter.lstLetter.length,
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 5,
    //                   mainAxisExtent: MediaQuery.of(context).size.height / 12,
    //                 ),
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Padding(
    //                       padding: const EdgeInsets.all(1),
    //                       child: Row(children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             border: Border.all(
    //                               color: Colors.black,
    //                               width: 2,
    //                             ),
    //                           ),
    //                           child: Text(
    //                             currentLetter.lstLetter[index],
    //                             style: const TextStyle(color: Colors.black),
    //                           ),
    //                         )
    //                       ]));
    //                 },
    //               ),
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
