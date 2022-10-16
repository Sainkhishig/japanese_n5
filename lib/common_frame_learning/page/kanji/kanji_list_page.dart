import 'package:afen_vocabulary/common/app_function.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/common/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'kanji_list_page_controller.dart';

class KanjiListPage extends HookConsumerWidget {
  KanjiListPage({Key? key}) : super(key: key);

  final trans = Translit();
  final keywordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    useEffect(() {}, const []);

    final controller = ref.watch(kanjiListProvider.notifier);
    controller.setModelListenable(ref);
    final future = useMemoized(() => controller.loadExcel());
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Error card", snapshot.error);
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    // }
    List<Widget> lsttableServings = [];
    // lstVocabul = lstN5db.box.get("N5Words");
    var filteredGrammar = controller.state.lstVocabulary;
    // if (controller.state.searchKey.trim().isNotEmpty) {
    //   filteredGrammar = controller.state.lstVocabulary
    //       .where((element) =>
    //           element.word.contains(controller.state.searchKey) ||
    //           element.translate.contains(controller.state.searchKey))
    //       .toList();
    // }

    if (filteredGrammar.isNotEmpty) {
      lsttableServings.add(tabCardBody(filteredGrammar, context, controller));
    }
    return Scaffold(
      body: Scaffold(
          body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
              Column(children: [
        CustomSearchBar(onSearch: (searchKey) {
          controller.setSearchKey(searchKey);
        }),
        lsttableServings.isEmpty
            ? showEmptyDataWidget()
            : Expanded(
                child: PageView(
                  controller: pageController,
                  children: lsttableServings,
                  onPageChanged: (value) {
                    controller.setSelectedIndex(value);
                  },
                ),
              )
      ])),
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

  Widget tabCardBody(List lst, context, controller) {
    // var currentLetter = lstVoc as List<Dictionary>;
    return Card(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  speak("");
                },
                icon: const Icon(Icons.volume_up),
              ),
              const Expanded(
                flex: 1,
                child: Text("Ханз"),
              ),
              const Expanded(
                flex: 2,
                child: Text("Утга"),
              ),
              const Expanded(
                flex: 2,
                child: Text("Он дуудлага"),
              ),
              const Expanded(
                flex: 2,
                child: Text("Кун дуудлага"),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: lst.length,
                itemBuilder: (BuildContext ctx, index) {
                  print("lst[index]");
                  print(lst[index].kanji);
                  print(lst[index].translate);
                  print(lst[index].onReading);
                  print(lst[index].kunReading);

                  // var kanji = lst[index] as KanjiDictionary;
                  return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        // padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
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
                            IconButton(
                              onPressed: () {
                                speak(lst[index].kunReading);
                              },
                              icon: const Icon(Icons.volume_up),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                lst[index].kanji,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text("${lst[index].translate}"),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text("${lst[index].onReading}"),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text("${lst[index].kunReading}"),
                            ),
                            // Expanded(
                            //   flex: 2,
                            //   child: Text(lst[index].onReading),
                            // ),
                            // Expanded(
                            //   flex: 2,
                            //   child: Text(lst[index].kunReading),
                            // ),

                            // Text(
                          ],
                        ),
                      ));
                }))
      ],
    ));
  }
}
