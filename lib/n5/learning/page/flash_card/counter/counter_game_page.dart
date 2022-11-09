import 'package:hishig_erdem/classes/counter_group.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_learning/constant_value/common_constants.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'counter_game_page_controller.dart';

// import 'letter_card_page_controller.dart';
// import 'letter_type.dart';

class CounterGamePage extends HookConsumerWidget {
  CounterGamePage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(counterGamePageProvider.notifier);
    controller.setModelListenable(ref);
    List<Widget> lsttableServings = [];

    // lsttableServings.add(tabCardBody(lstCounter, context, controller));
    List<CounterGroup> lstCounter = [];
    for (var counters in allCounter) {
      lstCounter.addAll(counters);
    }
    lsttableServings.add(tabCardBody(lstCounter, context, controller));
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
        // const Text(
        //   "Юмсыг тоолох нөхцөл",
        //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQuery.of(context).size.height / 12,
                    ),
                    itemCount: lstCounter.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                          alignment: Alignment.center,
                          child: FlashCard(
                            key: Key(index.toString()),
                            frontWidget: Text(
                              lstCounter[index].reading,
                              textAlign: TextAlign.center,
                            ),
                            backWidget: Text(
                              lstCounter[index].wordMn,
                              textAlign: TextAlign.center,
                            ),
                            // width: 50,
                            // height: 50,
                          ));
                    })))
      ],
    ));
  }
}
