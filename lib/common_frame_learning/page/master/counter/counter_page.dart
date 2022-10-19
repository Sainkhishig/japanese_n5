import 'dart:ui';

import 'package:afen_vocabulary/classes/counter_group.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/common_frame_learning/constant_value/common_constants.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
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
    for (var counters in allCounter) {
      lsttableServings.add(tabCardBody(counters, context, controller));
    }

    return Scaffold(
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

  Widget tabCardBody(List<CounterGroup> lstCounter, context, controller) {
    return Card(
        child: Column(
      children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                        crossAxisCount: lstCounter.length,
                        mainAxisExtent: MediaQuery.of(context).size.height /
                            lstCounter.length),
                    itemCount: lstCounter.length,
                    itemBuilder: (BuildContext ctx, index) {
                      CounterGroup counter = lstCounter[index];
                      return Container(
                          alignment: Alignment.center,
                          child: Column(
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
