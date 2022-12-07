import 'dart:html';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/classes/jlpt_level.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/voabulary/xl_vocabulary_hive_model.dart';
import 'package:hishig_erdem/common/widget/filter_chip_list_single_select.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_vocabulary_card_page_controller.dart';

class CommonVocabularyCardPage extends HookConsumerWidget {
  CommonVocabularyCardPage({Key? key}) : super(key: key);
  late List<JLPTLevel> listLevel = [];
  late List<String> listInterval = [];
  final pageItemCount = 60;
  late N5Box lstN5;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonVocabularyCardProvider.notifier);
    controller.setModelListenable(ref);
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    // var lstN5db = ref.read(n5BoxDataProvider);
    // var lstVocabul =
    //     lstN5db.box.get(lstCsvDBName[controller.state.dbNameIndex].dbName);
    final loginState = ref.watch(loginStateNotifierProvider.notifier);
    final hiveBox = controller.getHiveBox(loginState.hiveInfo.jlptLevel);

    if (hiveBox.lstVocabulary == null || hiveBox.lstVocabulary.isEmpty) {
      final future = useMemoized(() => readXlVocabulary(ref));
      final snapshot = useFuture(future, initialData: null);
      if (snapshot.hasError) {
        return showErrorWidget(context, "Алдаа гарлаа", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }

    List<XlVocabularyHiveModel> lstXlVocabulary =
        hiveBox.lstVocabulary.cast<XlVocabularyHiveModel>();
    List<Widget> lsttableServings = [];
    // if (lstXlVocabulary != null) {
    //   var sectionCount = (lstXlVocabulary.length / 10).ceil();
    //   listLevel = [];
    //   for (var i = 1; i <= sectionCount; i++) {
    //     listLevel.add(JLPTLevel(i, "x - $i"));
    //   }
    //   var lstVocDataRange = lstXlVocabulary.getRange(
    //       (controller.state.pageIndex - 1), lstXlVocabulary.length - 1);
    //   for (var element in lstVocDataRange) {
    //     lsttableServings.add(tabCardBody(element, context, controller));
    //   }
    // }
    var lstVocabularyPart = [];
    if (lstXlVocabulary.isNotEmpty) {
      lstVocabularyPart = sliceList(lstXlVocabulary, pageItemCount);
      for (var element
          in lstVocabularyPart[controller.state.selectedPageIndex - 1]) {
        lsttableServings.add(tabCardBody(element, context, controller));
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text("Vocabulary"),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: DropdownButton(
      //         value: controller.state.pageIndex,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           color: Colors.black,
      //         ),
      //         items: listLevel
      //             .map((e) => DropdownMenuItem(
      //                   value: e.id,
      //                   child: Text(e.name),
      //                 ))
      //             .toList(),
      //         onChanged: (lvl) async {
      //           controller.setLevel(lvl as int);
      //         },
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: DropdownButton(
      //         value: controller.state.dbNameIndex,
      //         style: const TextStyle(
      //           fontSize: 14,
      //           color: Colors.black,
      //         ),
      //         items: lstCsvDBName.asMap().entries.map((entry) {
      //           return DropdownMenuItem(
      //             value: entry.key,
      //             child: Text(entry.value.name),
      //           );
      //         }).toList(),
      //         onChanged: (lvl) async {
      //           controller.setDb(lvl as int);
      //         },
      //       ),
      //     )
      //   ],
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
          height: 80,
          color: Colors.grey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text("карт: "),
                  Row(
                    children: [
                      IconButton(
                        padding: const EdgeInsets.only(bottom: 4),
                        iconSize: 40,
                        disabledColor: Colors.grey,
                        color: Colors.white,
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          if (pageController.page!.toInt() > 0) {
                            controller.setSelectedIndex(
                                pageController.page!.toInt() - 1);
                            pageController.animateToPage(
                                pageController.page!.toInt() - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                      ),
                    ],
                  ),
                  Text(lsttableServings.isEmpty
                      ? "карт: 0/0"
                      : "карт: ${controller.state.selectedCardIndex}/${lsttableServings.length}"),
                  IconButton(
                    padding: const EdgeInsets.only(bottom: 4),
                    iconSize: 40,
                    disabledColor: Colors.grey,
                    color: Colors.white,
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      if (pageController.page!.toInt() + 1 <
                          lsttableServings.length) {
                        controller
                            .setSelectedIndex(pageController.page!.toInt() + 1);
                        pageController.animateToPage(
                            pageController.page!.toInt() + 1,
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("хуудас: "),
                FilterChipListSingleSelect(
                  isSingleSelect: true,
                  value: "${controller.state.selectedPageIndex - 1}",
                  // initValues: DATA_SALE_PERIOD_FILTER,
                  dataSource: lstVocabularyPart
                      .asMap()
                      .entries
                      .map((e) => CheckBoxModel("${e.key}", "${e.key + 1}",
                          isChecked: (e.key + 1) ==
                              controller.state.selectedPageIndex))
                      .toList(),
                  onChangeValue: (value) =>
                      controller.setSelectedPageIndex(int.parse(value) + 1),
                  // controller.updateSalePeriodFilter = value,
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width - 100,
                //   child:
                // ),
              ])
            ],
          )),
    );
  }

  Widget tabCardBody(XlVocabularyHiveModel currentWord, context, controller) {
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
                  currentWord.meaningMn,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ))),
                Visibility(
                    visible: controller.isShowPreference ?? true,
                    child: TextButton.icon(
                      onPressed: () {
                        speak(currentWord.example1);
                      },
                      icon: const Icon(Icons.volume_up),
                      label: Text(currentWord.example1),
                    )),
                Expanded(flex: 1, child: Text(currentWord.example1Mn))
              ],
            )),
            backWidget: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  currentWord.kanji.isNotEmpty
                      ? currentWord.kanji
                      : currentWord.kana,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Visibility(
                  visible: controller.isShowPreference ?? true,
                  child: IconButton(
                    onPressed: () {
                      if (currentWord.kanji.isNotEmpty) {
                        speak(currentWord.kanji);
                      } else {
                        speak(currentWord.kana);
                      }
                    },
                    iconSize: 50,
                    icon: const Icon(Icons.volume_up),
                  ),
                )
              ],
            ))));
  }
}
