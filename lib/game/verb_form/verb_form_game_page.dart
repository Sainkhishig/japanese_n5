import 'dart:math';

import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_practice.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:translit/translit.dart';

import 'verb_form_page_controller.dart';

class VerbFormGamePage extends HookConsumerWidget {
  VerbFormGamePage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  Random rnd = Random();
  KanaKit kanakit2 = const KanaKit();

  TextEditingController tcVerb = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(verbFormGamePageProvider.notifier);
    controller.setModelListenable(ref);
    List<Widget> lsttableServings = [];

    var listDragItem = controller.state.lstVerbForms
        .map(
          (verbResult) => ConfugationResultForm(verbResult),
        )
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 200,
                    child: SwitchListTile(
                      title: const Text('Дасгал'),
                      value: controller.state.isTestMode,
                      onChanged: (value) {
                        if (value) {
                          var verb = lstVerb[rnd.nextInt(lstVerb.length)];
                          controller.setVerb(verb);
                          conjugateFormula(controller, verb);
                        }
                        controller.setTestMode(value);
                      },
                      // secondary: const Icon(Icons.lightbulb_outline),
                    )),
                Visibility(
                    visible: !controller.state.isTestMode,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: tcVerb,
                            decoration: const InputDecoration(
                                labelText: "хувиргах үг",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text("хувиргах"),
                          onPressed: () async {
                            var verb = tcVerb.text;
                            if (verb.trim().isNotEmpty) {
                              conjugateFormula(controller, verb);
                            }
                            // verb.endsWith(other)
                          },
                        ),
                      ],
                    ))
              ],
            ),
            Visibility(
              visible: !controller.state.isTestMode,
              child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: listDragItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listDragItem[index].build(context, ref);
                      })),
            ),
            Visibility(
              visible: controller.state.isTestMode,
              child: Expanded(
                child: StatefulBuilder(builder: (context, setState) {
                  return Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.state.currentVerb,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${listDragItem.where((element) => element.result.conjugatedVerb == kanakit2.toHiragana(element.tcTest.text.trim())).toList().length} / ${controller.state.lstVerbForms.length}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ]),
                    const Divider(),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listDragItem.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listDragItem[index].build(context, ref);
                            })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            child: const Text("шалгах"),
                            onPressed: () async {
                              setState(() {
                                listDragItem.forEach((rowElement) {
                                  rowElement.isChecked = true;
                                });
                              });
                            }),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            child: const Text("next"),
                            onPressed: () async {
                              var verb = lstVerb[rnd.nextInt(lstVerb.length)];
                              controller.setVerb(verb);
                              conjugateFormula(controller, verb);
                              // controller.setVerb(verb)
                              setState(() {
                                listDragItem.forEach((rowElement) {
                                  rowElement.isChecked = true;
                                });
                              });
                            })
                      ],
                    )
                  ]);
                }),
              ),
            )
            // )
          ],
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

  conjugateFormula(VerbFormGamePageController controller, String verb) {
    VerbGroup group;
    var verbEnding = "";

    var verbKana =
        kanakit2.isRomaji(verb) ? verb.trim() : kanakit2.toRomaji(verb);

    if (verbKana.endsWith("suru") || verbKana.endsWith("kuru")) {
      if (verbKana.endsWith("suru")) {
        verbEnding = "suru";
      } else {
        verbEnding = "kuru";
      }
      group = VerbGroup.irregular;
    } else if ((verbKana.endsWith("eru") || verbKana.endsWith("iru")) ||
        lstIrregularGodan.contains(verbKana)) {
      if (verbKana.endsWith("eru")) {
        verbEnding = "ru";
      } else {
        verbEnding = "ru";
      }
      group = VerbGroup.ichidan;
    } else {
      lstGodanEnding.forEach((endGodan) {
        if (verbKana.endsWith(kanakit2.toRomaji(endGodan))) {
          verbEnding = kanakit2.toRomaji(endGodan);
        }
      });
      group = VerbGroup.godan;
    }
    var verbRoot = verbKana.split(verbEnding)[0];
    controller.conjugateVerb(group, verbRoot, verbEnding);
  }
}

class ConfugationResultForm extends HookConsumerWidget {
  ConfugationResultForm(this.result, {Key? key}) : super(key: key);
  final ConjugationResult result;
  bool? isChecked;
  KanaKit kanakit2 = KanaKit();
  final TextEditingController tcTest = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  ($conjugatedVerb)
    final controller = ref.watch(verbFormGamePageProvider.notifier);
    var answer = kanakit2.toRomaji(tcTest.text.trim());
    var testResult = kanakit2.toRomaji(result.conjugatedVerb) == answer;
    return Row(
      children: [
        Expanded(
          child: ExpansionTile(
            // tilePadding: EdgeInsets.zero,
            title: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text("${result.conjName}: ",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: !controller.state.isTestMode ||
                              (isChecked ?? false),
                          child: Text(
                            " ${result.conjugatedVerb} ",
                            textAlign: TextAlign.start,
                            style: const TextStyle(color: Colors.indigo),
                          ),
                        ),
                        Visibility(
                          visible: controller.state.isTestMode,
                          child: Container(
                            // width: 200,
                            // height: 50,
                            child: TextFormField(
                              readOnly: (isChecked ?? false),
                              controller: tcTest,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Visibility(
                    visible:
                        controller.state.isTestMode && (isChecked ?? false),
                    child: testResult
                        ? const Icon(
                            Icons.mood_outlined,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.mood_bad,
                            color: Colors.red,
                          ),
                  ),
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(8.0),
            children: [Text(result.desctiprion)],
          ),
        ),
      ],
    );
  }
}
