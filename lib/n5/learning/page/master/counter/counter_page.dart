import 'package:hishig_erdem/classes/counter_group.dart';
import 'package:hishig_erdem/classes/word_group.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_learning/constant_value/common_constants.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'counter_page_controller.dart';

class CounterPage extends HookConsumerWidget {
  CounterPage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(counterPageProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lsttableServings = [];
    lsttableServings.add(numberCardBody(lstNumbers, context, controller));
    for (var counters in allCounter) {
      lsttableServings.add(tabCardBody(counters, context, controller));
    }

    return Scaffold(
      body: lsttableServings.isEmpty
          ? showEmptyDataWidget()
          : PageView(
              controller: pageController,
              children: lsttableServings,
              onPageChanged: (value) {
                controller.setSelectedIndex(value);
              },
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

  Widget numberCardBody(WordGroup currentLetter, context, controller) {
    var mainAxisExtent =
        (currentLetter.lstWord.length < 10 || currentLetter.name == "Өдөр")
            ? 12
            : 22;
    return Card(
        child: Column(
      children: [
        Text(
          currentLetter.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 1,
                    mainAxisExtent: MediaQuery.of(context).size.height /
                        mainAxisExtent, //(currentLetter.lstWord.length + 2),
                  ),
                  itemCount: currentLetter.lstWord.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(5),
                      //   border: Border.all(
                      //     color: Colors.black,
                      //     width: 1,
                      //   ),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: controller.isShowPreference ?? true,
                            child: IconButton(
                              onPressed: () {
                                speak(
                                  currentLetter.lstWord[index].reading,
                                );
                              },
                              icon: Icon(Icons.volume_up),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                currentLetter.lstWord[index].kanji,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  currentLetter.lstWord[index].reading,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                currentLetter.lstWord[index].wordMn,
                              ),
                            ),
                          ),
                          // Text(
                        ],
                      ),
                    );
                  }),
            ))
      ],
    ));
  }

  Widget tabCardBody(List<CounterGroup> lstCounter, context, controller) {
    // var title = lstCounter.map((e) => e.wordMn.join(',')).toList();
    var title = lstCounter.map<String>((value) => value.wordMn).join(',');

    return Card(
        child: Column(
      children: [
        Text(title.substring(1)),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        crossAxisCount: lstCounter.length,
                        // crossAxisSpacing: 2,
                        // mainAxisSpacing: 0,
                        // crossAxisCount: lstCounter.length,
                        mainAxisExtent: MediaQuery.of(context).size.height),
                    itemCount: lstCounter.length,
                    itemBuilder: (BuildContext ctx, index) {
                      CounterGroup counter = lstCounter[index];
                      return Container(
                          alignment: Alignment.center,
                          child: ListView(
                            children: [
                              borderWidget(counter.wordMn,
                                  fontWight: FontWeight.bold),
                              borderWidget(
                                  "${counter.kanji}\n[${counter.reading}]",
                                  fontWight: FontWeight.bold),
                              borderWidget(counter.sampleCounter.one,
                                  heightRow: 25),
                              borderWidget(counter.sampleCounter.two),
                              borderWidget(counter.sampleCounter.three),
                              borderWidget(counter.sampleCounter.four),
                              borderWidget(counter.sampleCounter.five,
                                  heightRow: 25),
                              borderWidget(counter.sampleCounter.six,
                                  heightRow: 25),
                              borderWidget(counter.sampleCounter.seven),
                              borderWidget(counter.sampleCounter.eight),
                              borderWidget(counter.sampleCounter.nine),
                              borderWidget(counter.sampleCounter.ten),
                            ],
                          ));
                    })))
      ],
    ));
  }

  Widget borderWidget(String text,
      {double heightRow = 50, FontWeight fontWight = FontWeight.normal}) {
    return Container(
      height: heightRow,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: fontWight),
      ),
    );
  }
}
