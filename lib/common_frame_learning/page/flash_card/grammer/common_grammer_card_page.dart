import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/classes/jlpt_level.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/grammar/xl_grammar_hive_model.dart';

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/widget/filter_chip_list_single_select.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_grammer_card_page_controller.dart';

class CommonGrammarCardPage extends HookConsumerWidget {
  CommonGrammarCardPage({Key? key}) : super(key: key);
  late List<JLPTLevel> listLevel = [];
  late List<String> listInterval = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(commonGrammerCardProvider.notifier);
    controller.setModelListenable(ref);

    final loginState = ref.watch(loginStateNotifierProvider.notifier);
    final hiveBox = controller.getHiveBox(loginState.hiveInfo.jlptLevel);

    if (hiveBox.lstGrammar == null || hiveBox.lstGrammar.isEmpty) {
      final future = useMemoized(() => readXlGrammar(ref));
      final snapshot = useFuture(future, initialData: null);
      if (snapshot.hasError) {
        return showErrorWidget(context, "Алдаа гарлаа", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }

    List<XlGrammarHiveModel> lstXlGrammar =
        hiveBox.lstGrammar.cast<XlGrammarHiveModel>();

    listLevel = [];

    List<Widget> lsttableServings = [];
    var sectionCount = (lstXlGrammar.length / 10).ceil();
    for (var i = 1; i <= sectionCount; i++) {
      listLevel.add(JLPTLevel(i, "x-$i"));
    }
    var lstVocDataRange = lstXlGrammar.getRange(
        (controller.state.pageIndex - 1) * 10, lstXlGrammar.length - 1);
    for (var element in lstVocDataRange) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }

    return Scaffold(
      appBar: AppBar(
        // title: const Text("Vocabulary"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton(
                value: controller.state.pageIndex,
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
            ),
            FilterChipListSingleSelect(
              isSingleSelect: true,
              value: "${controller.state.selectedCardIndex - 1}",
              // initValues: DATA_SALE_PERIOD_FILTER,
              dataSource: lsttableServings
                  .asMap()
                  .entries
                  .map((e) => CheckBoxModel("${e.key}", "${e.key + 1}",
                      isChecked:
                          (e.key + 1) == controller.state.selectedPageIndex))
                  .toList(),
              onChangeValue: (value) {
                controller.setSelectedIndex(int.parse(value));
                pageController.animateToPage(int.parse(value),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },

              // controller.updateSalePeriodFilter = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget tabCardBody(XlGrammarHiveModel currentWord, context, controller) {
    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 100,
            frontWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      currentWord.meaningMn,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        speak(currentWord.example1);
                      },
                      icon: const Icon(Icons.volume_up),
                      label: Text(currentWord.example1),
                    ), //テキスト

                    // Text("(${currentWord.exampleRomaji})"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(currentWord.example1Mn)
                  ],
                )
                // Expanded(flex: 1, child: Text(currentWord.exampleRomaji)),

                // Expanded(flex: 1, child: Text(currentWord.exampleTr)),
              ],
            ),
            backWidget: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      currentWord.grammar,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
              ],
            )));
  }
}
