import 'package:afen_vocabulary/classes/grammar.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/common/search_bar.dart';
import 'package:afen_vocabulary/constant_value/common_constants.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'grammer_page_controller.dart';

class GrammerPage extends HookConsumerWidget {
  GrammerPage({Key? key}) : super(key: key);

  final trans = Translit();

  final keywordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(grammerPageProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lsttableServings = [];
    // if (lstVocabul.isNotEmpty) {
    var filteredGrammar = lstGrammar;
    if (controller.state.searchKey.trim().isNotEmpty) {
      filteredGrammar = lstGrammar
          .where(
              (element) => element.grammar.contains(controller.state.searchKey))
          .toList();
    }
    lsttableServings.add(tabCardBody(filteredGrammar, context, controller));
    // }
    return Scaffold(
      body: lsttableServings.isEmpty
          ? showEmptyDataWidget()
          : //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
              children: [
                CustomSearchBar(onSearch: () {
                  controller.setSearchKey(keywordController.text);
                }),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: lsttableServings,
                    onPageChanged: (value) {
                      controller.setSelectedIndex(value);
                    },
                  ),
                )
              ],
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

  Widget tabCardBody(List<Grammar> lst, context, controller) {
    // var currentLetter = lstVoc as List<Dictionary>;
    // var ss =
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lst.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      lst[index].grammar,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      lst[index].grammarMn,
                                    ),
                                  ),
                                  // Text(
                                ],
                              ),
                            ));
                      }))
            ]));
  }
}
