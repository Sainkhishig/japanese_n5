import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/voabulary/xl_vocabulary_hive_model.dart';
import 'package:hishig_erdem/common/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/common/widget/filter_chip_list_single_select.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'common_vocabulary_list_page_controller.dart';

class CommonVocabularyListPage extends HookConsumerWidget {
  CommonVocabularyListPage({Key? key}) : super(key: key);

  final trans = Translit();
  final keywordController = TextEditingController();
  List<Widget> lstVocabularyWidget = [];
  List<XlVocabularyHiveModel> lstAllVocabulary = [];
  final pageItemCount = 60;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonVocabularyListPageController.notifier);
    controller.setModelListenable(ref);

    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final loginState = ref.watch(loginStateNotifierProvider.notifier);
    final hiveBox = controller.getHiveBox(loginState.hiveInfo.jlptLevel);
    if (hiveBox.lstVocabulary == null || hiveBox.lstVocabulary.isEmpty) {
      final future = useMemoized(() => readXlVocabulary(ref));
      final snapshot = useFuture(future, initialData: null);
      if (snapshot.hasError) {
        return showErrorWidget(context, "Error card", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }

    lstAllVocabulary = hiveBox.lstVocabulary.cast<XlVocabularyHiveModel>();

    var searchKey = controller.state.searchKey;
    var filteredGrammar = lstAllVocabulary
        .where((element) =>
            element.kanji.contains(searchKey) ||
            element.kana.contains(searchKey) ||
            element.meaningMn.contains(searchKey))
        .toList();

    var listVocabulary = sliceList(filteredGrammar, pageItemCount);
    lstVocabularyWidget = [];
    for (var partition in listVocabulary) {
      lstVocabularyWidget
          .add(tabCardBody(partition, context, controller, "shine ugs"));
    }
    // lstVocabularyWidget
    //     .add(tabCardBody(lstAllVocabulary, context, controller, "data.name"));
    return Scaffold(
      body: Scaffold(
          body: Column(children: [
        CustomSearchBar(
          searchKey: controller.state.searchKey,
          onSearch: (searchKey) {
            controller.setSearchKey(searchKey);
          },
          onClear: () {
            controller.setSearchKey("");
          },
        ),
        lstVocabularyWidget.isEmpty
            ? showEmptyDataWidget()
            : controller.state.searchKey.isEmpty
                ? Expanded(
                    child: PageView(
                    controller: pageController,
                    children: lstVocabularyWidget,
                    onPageChanged: (value) {
                      controller.setSelectedIndex(value);
                    },
                  ))
                : Expanded(
                    child: tabCardBody(
                        lstAllVocabulary
                            .where((element) =>
                                element.kanji
                                    .contains(controller.state.searchKey) ||
                                element.kana
                                    .contains(controller.state.searchKey) ||
                                element.meaningMn
                                    .contains(controller.state.searchKey))
                            .toList(),
                        context,
                        controller,
                        "Хайлтын үр дүн:"))
      ])),
      bottomNavigationBar: Container(
          height: 40,
          color: Colors.grey,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // alignment: WrapAlignment.spaceBetween,
              // spacing: 26,
              // direction: Axis.horizontal,
              children: [
                const Text("хуудас: "),
                FilterChipListSingleSelect(
                  isSingleSelect: true,
                  value: "${controller.state.selectedCardIndex - 1}",
                  // initValues: DATA_SALE_PERIOD_FILTER,
                  dataSource: lstVocabularyWidget
                      .asMap()
                      .entries
                      .map((e) => CheckBoxModel("${e.key}", "${e.key + 1}",
                          isChecked: (e.key + 1) ==
                              controller.state.selectedPageIndex))
                      .toList(),
                  onChangeValue: (value) =>
                      controller.setSelectedIndex(int.parse(value)),
                  // controller.updateSalePeriodFilter = value,
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width - 100,
                //   child:
                // ),
              ])
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     IconButton(
          //       padding: const EdgeInsets.only(bottom: 4),
          //       iconSize: 40,
          //       disabledColor: Colors.grey,
          //       color: Colors.white,
          //       icon: const Icon(Icons.chevron_left),
          //       onPressed: () {
          //         if (pageController.page!.toInt() > 0) {
          //           controller.setSelectedIndex(pageController.page!.toInt() - 1);
          //           pageController.animateToPage(pageController.page!.toInt() - 1,
          //               duration: const Duration(milliseconds: 500),
          //               curve: Curves.ease);
          //         }
          //       },
          //     ),
          //     Padding(
          //         padding: const EdgeInsets.all(8),
          //         child: Text(lstVocabularyWidget.isEmpty
          //             ? " 0/0"
          //             : " ${controller.state.selectedCardIndex}/${lstVocabularyWidget.length}")),
          //     IconButton(
          //       padding: const EdgeInsets.only(bottom: 4),
          //       iconSize: 40,
          //       disabledColor: Colors.grey,
          //       color: Colors.white,
          //       icon: const Icon(Icons.chevron_right),
          //       onPressed: () {
          //         if (pageController.page!.toInt() + 1 <
          //             lstVocabularyWidget.length) {
          //           controller.setSelectedIndex(pageController.page!.toInt() + 1);
          //           pageController.animateToPage(pageController.page!.toInt() + 1,
          //               duration: const Duration(milliseconds: 500),
          //               curve: Curves.ease);
          //         } else if (pageController.page!.toInt() != 0) {
          //           controller.setSelectedIndex(0);
          //           pageController.animateToPage(0,
          //               duration: const Duration(milliseconds: 500),
          //               curve: Curves.ease);
          //         }
          //       },
          //     )
          //   ],
          // ),
          ),
    );
  }

  Widget tabCardBody(List<XlVocabularyHiveModel> lst, context,
      CommonVocabularyListPageController controller, String title) {
    // var currentLetter = lstVoc as List<Dictionary>;
    return Card(
        child: Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.all(5),
        //   child: Text(
        //     title,
        //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //   ),
        // ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: lst.length,
                itemBuilder: (BuildContext ctx, index) {
                  int wordIndex =
                      (controller.state.selectedCardIndex - 1) * pageItemCount +
                          index +
                          1;
                  return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        // padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(5),
                        //   border: Border(
                        //     top: BorderSide(width: 1.0, color: Colors.grey),
                        //   ),
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(" ${wordIndex}."),
                            Visibility(
                              visible: controller.isShowPreference ?? true,
                              child: IconButton(
                                onPressed: () {
                                  speak(lst[index].kana);
                                },
                                icon: Icon(Icons.volume_up),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                lst[index].kanji.isNotEmpty
                                    ? lst[index].kanji
                                    : lst[index].kana,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                lst[index].meaningMn.contains("null")
                                    ? ""
                                    : lst[index].meaningMn,
                              ),
                            ),
                            // Text(
                          ],
                        ),
                      ));
                }))
      ],
    ));
  }
}
