import 'package:hishig_erdem/classes/word_group.dart';
import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common_frame_learning/constant_value/common_constants.dart';

import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'master_data_page_controller.dart';

class MasterDataPage extends HookConsumerWidget {
  MasterDataPage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(letterCardProvider.notifier);
    controller.setModelListenable(ref);
    List<Widget> lsttableServings = [];
    for (var element in lstDate) {
      lsttableServings.add(tabCardBody(element, context, controller));
    }
    return Scaffold(
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
            )
          ],
        ),
      ),
    );
  }

  Widget tabCardBody(WordGroup currentLetter, context, controller) {
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
}
