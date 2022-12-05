import 'dart:ui';

import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';
import 'package:hishig_erdem/common/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/main/login_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'common_kanji_list_page_controller.dart';

class CommonKanjiListPage extends HookConsumerWidget {
  CommonKanjiListPage({Key? key}) : super(key: key);

  final trans = Translit();
  final keywordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(commonKanjiListProvider.notifier);
    controller.setModelListenable(ref);

    final loginState = ref.watch(loginStateNotifierProvider.notifier);
    final hiveBox = controller.getHiveBox(loginState.hiveInfo.jlptLevel);

    if (hiveBox.lstKanji == null || hiveBox.lstKanji.isEmpty) {
      final future = useMemoized(() => readXlKanji(ref));
      final snapshot = useFuture(future, initialData: null);
      if (snapshot.hasError) {
        return showErrorWidget(context, "Error card", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }
    List<Widget> lsttableServings = [];
    List<XlKanjiHiveModel> filteredGrammar =
        hiveBox.lstKanji.cast<XlKanjiHiveModel>();
    var list = sliceList(filteredGrammar, 30);
    for (var partition in list) {
      lsttableServings.add(gridCardBody(partition, context, controller));
    }
    // if (filteredGrammar.isNotEmpty) {
    //   lsttableServings.add(tabCardBody(filteredGrammar, context, controller));
    // }
    // filteredGrammar.first.kanji
    // filteredGrammar.first.example1
    // filteredGrammar.first.meaningMn
    return Scaffold(
      body: Scaffold(
          body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
              Column(children: [
        CustomSearchBar(onSearch: (searchKey) {
          controller.setSearchKey(searchKey);
        }),
        controller.state.selectedKanjiInfo == null
            ? Text(
                "N${loginState.hiveInfo.jlptLevel} түвшний нийт: ${filteredGrammar.length} ханз",
                style: const TextStyle(fontSize: 20),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      // decoration: const BoxDecoration(
                      //   border: Border(
                      //     right: BorderSide(width: 2.0, color: Colors.grey),
                      //   ),
                      // ),
                      alignment: Alignment.center,
                      child: Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            "${controller.state.selectedKanjiInfo.kanji}",
                            style: const TextStyle(
                                fontSize: 60,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      )),
                  // const VerticalDivider(thickness: 1.0, color: Colors.black12),
                  Container(
                    width: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 2.0, color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(" он дуудлага:"),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                    "${controller.state.selectedKanjiInfo.onReading}"),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(" күн дуудлага:"),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                    "${controller.state.selectedKanjiInfo.kunReading}"),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(" утга:"),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                    "${controller.state.selectedKanjiInfo.meaningMn}"),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(" жишээ:"),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${controller.state.selectedKanjiInfo.example1}"),
                                      Text(
                                          "${controller.state.selectedKanjiInfo.example1Mn}"),
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ))
                ],
              ),
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

  Widget gridCardBody(List<XlKanjiHiveModel> lstKanji, context,
      CommonKanjiListPageController controller) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount:
              5, // Double.parse("${MediaQuery.of(context).size.width / 100}"),
          mainAxisExtent: MediaQuery.of(context).size.height / 12,
        ),
        itemCount: lstKanji.length,
        itemBuilder: (BuildContext ctx, index) {
          return Card(
            elevation: 4.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  controller.setShowKanji(index, lstKanji[index]);
                },
                child: Text(
                  lstKanji[index].kanji,
                  style: const TextStyle(color: Colors.black),
                )),
          );
        });
  }

  Widget tabCardBody(List<XlKanjiHiveModel> lst, context, controller) {
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
              Visibility(
                visible: controller.isShowPreference ?? true,
                child: IconButton(
                  onPressed: () {
                    speak("");
                  },
                  icon: const Icon(Icons.volume_up),
                ),
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
                            Visibility(
                              visible: controller.isShowPreference ?? true,
                              child: IconButton(
                                onPressed: () {
                                  speak(lst[index].kunReading);
                                },
                                icon: const Icon(Icons.volume_up),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                lst[index].kanji,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(lst[index].meaningMn),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(lst[index].onReading),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(lst[index].kunReading),
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
