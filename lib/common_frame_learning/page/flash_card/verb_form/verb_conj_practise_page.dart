import 'dart:math';

import 'package:afen_vocabulary/common/app_function.dart';
import 'package:afen_vocabulary/common_frame_learning/page/verb_conjugation/conjugation_constant.dart';
import 'package:afen_vocabulary/common_frame_learning/page/verb_conjugation/conjugation_practice.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';

import 'verb_conj_practise_page_controller.dart';

class VerbConjugationPracticePage extends HookConsumerWidget {
  VerbConjugationPracticePage({Key? key}) : super(key: key);

  Random randomVerbToExercise = Random();
  KanaKit kanakit2 = const KanaKit();

  TextEditingController tcVerbConjugator = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(verbConjPracticePageProvider.notifier);
    controller.setModelListenable(ref);

    var lstWidgetConjugatedResult = controller.state.lstConjugateResult
        .map(
          (conjugatedVerb) => ExerciseVerbConjResultForm(conjugatedVerb),
        )
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 165,
                    child: SwitchListTile(
                      title: const Text('Дасгал'),
                      value: controller.state.isTestMode,
                      onChanged: (value) {
                        if (value) {
                          var verb = lstVerb[
                              randomVerbToExercise.nextInt(lstVerb.length)];
                          controller.setVerb(verb);
                          conjugateVerbByFormula(controller, verb);
                        }
                        controller.setExerciseMode(value);
                      },
                      // secondary: const Icon(Icons.lightbulb_outline),
                    )),
                Visibility(
                    visible: !controller.state.isTestMode,
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: tcVerbConjugator,
                            decoration: const InputDecoration(
                                labelText: "хувиргах үг",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text("хувиргах"),
                          onPressed: () async {
                            var verb = tcVerbConjugator.text;
                            if (verb.trim().isNotEmpty) {
                              conjugateVerbByFormula(controller, verb);
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
                      itemCount: lstWidgetConjugatedResult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return lstWidgetConjugatedResult[index]
                            .build(context, ref);
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
                            "${lstWidgetConjugatedResult.where((element) => element.result.conjugatedVerb == kanakit2.toHiragana(element.tcTest.text.trim())).toList().length} / ${controller.state.lstConjugateResult.length}",
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
                            itemCount: lstWidgetConjugatedResult.length,
                            itemBuilder: (BuildContext context, int index) {
                              return lstWidgetConjugatedResult[index]
                                  .build(context, ref);
                            })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            child: const Text("шалгах"),
                            onPressed: () async {
                              setState(() {
                                for (var rowElement
                                    in lstWidgetConjugatedResult) {
                                  rowElement.isChecked = true;
                                }
                              });
                            }),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.arrow_forward_sharp),
                          onPressed: () async {
                            var verb = lstVerb[
                                randomVerbToExercise.nextInt(lstVerb.length)];
                            controller.setVerb(verb);
                            conjugateVerbByFormula(controller, verb);
                            // controller.setVerb(verb)
                            setState(() {
                              for (var rowElement
                                  in lstWidgetConjugatedResult) {
                                rowElement.isChecked = true;
                              }
                            });
                          },
                          label: Text(""),
                        )
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
    );
  }

  conjugateVerbByFormula(VerbConjPracticePageProvider controller, String verb) {
    VerbGroup group;
    var verbEnding = "";
    var verbHiragana = kanakit2.toHiragana(verb);
    var verbKana =
        kanakit2.isRomaji(verb) ? verb.trim() : kanakit2.toRomaji(verb);

    if (!lstIrregularGodan.contains(verbHiragana) &&
        (verbKana.endsWith("suru") || verbKana.endsWith("kuru"))) {
      if (verbKana.endsWith("suru")) {
        verbEnding = "suru";
      } else {
        verbEnding = "kuru";
      }
      group = VerbGroup.irregular;
    } else if ((verbKana.endsWith("eru") || verbKana.endsWith("iru")) &&
        !lstIrregularGodan.contains(verbHiragana)) {
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

    var verbRoot = verbKana.substring(0, verbKana.length - verbEnding.length);
    controller.conjugateVerb(group, verbRoot, verbEnding);
  }
}

class ExerciseVerbConjResultForm extends HookConsumerWidget {
  ExerciseVerbConjResultForm(this.result, {Key? key}) : super(key: key);
  final ConjugationResult result;
  bool? isChecked;
  KanaKit kanakit2 = KanaKit();
  final TextEditingController tcTest = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(verbConjPracticePageProvider.notifier);
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
                          visible: controller.state.isTestMode,
                          child: TextFormField(
                            readOnly: (isChecked ?? false),
                            controller: tcTest,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Visibility(
                            visible: !controller.state.isTestMode ||
                                (isChecked ?? false),
                            child: Row(
                              children: [
                                Visibility(
                                  visible: controller.isShowPreference ?? true,
                                  child: IconButton(
                                    onPressed: () {
                                      speak(result.conjugatedVerb);
                                    },
                                    icon: const Icon(Icons.volume_up),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    " ${result.conjugatedVerb} ",
                                    textAlign: TextAlign.start,
                                    style:
                                        const TextStyle(color: Colors.indigo),
                                  ),
                                )
                              ],
                            )),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
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
