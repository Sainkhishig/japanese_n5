import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/classes/jlpt_level.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/kanji/xl_kanji_hive_model.dart';

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common_kanji_card_page_controller.dart';

class CommonKanjiCardPage extends HookConsumerWidget {
  CommonKanjiCardPage({Key? key}) : super(key: key);
  late List<JLPTLevel> listLevel = [];
  late List<String> listInterval = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonKanjiCardProvider.notifier);
    controller.setModelListenable(ref);

    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
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

    List<XlKanjiHiveModel> lstXlKanji =
        hiveBox.lstKanji.cast<XlKanjiHiveModel>();

    listLevel = [];

    List<Widget> lsttableServings = [];
    var sectionCount = (lstXlKanji.length / 10).ceil();
    for (var i = 1; i <= sectionCount; i++) {
      listLevel.add(JLPTLevel(i, "x-$i"));
    }
    var lstVocDataRange = lstXlKanji.getRange(
        (controller.state.pageIndex - 1) * 10, lstXlKanji.length - 1);
    for (var element in lstVocDataRange) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }

    return Scaffold(
      appBar: AppBar(
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

  Widget tabCardBody(XlKanjiHiveModel currentWord, context, controller) {
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
                    label: Text("${currentWord.meaningMn}"),
                  ),
                ),
                Expanded(flex: 1, child: Text(currentWord.example1Mn)),
                Expanded(
                    flex: 1,
                    child: Text(
                        "он дуудлага: ${currentWord.onReading}\nкүн дуудлага: ${currentWord.kunReading}")),
                // Expanded(
                //     flex: 1,
                //     child: Text("күн дуудлага: ${currentWord.kunReading}")),
              ],
            )),
            backWidget: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  currentWord.kanji,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Text(
                  "жишээ: ${currentWord.example1}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
                // IconButton(
                //   onPressed: () {
                //     speak(currentWord.word);
                //   },
                //   iconSize: 50,
                //   icon: Icon(Icons.volume_up),
                // ),
              ],
            ))));
  }
}
