import 'package:hishig_erdem/common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/n5/learning/page/verb_conjugation/conjugation_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'verb_form_page_controller.dart';

class VerbFormPage extends HookConsumerWidget {
  VerbFormPage({Key? key}) : super(key: key);

  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(verbFormPageProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lstPages = [];

    for (var element in [
      VerbGroup.godan,
      VerbGroup.ichidan,
      VerbGroup.irregular,
      null
    ]) {
      lstPages.add(pageBody(element, context, controller, ref));
    }
    return Scaffold(
      body: Scaffold(
        body: lstPages.isEmpty
            ? showEmptyDataWidget()
            : PageView(
                controller: pageController,
                children: lstPages,
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
                child: Text(lstPages.isEmpty
                    ? " 0/0"
                    : " ${controller.state.selectedCardIndex}/${lstPages.length}")),
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                if (pageController.page!.toInt() + 1 < lstPages.length) {
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

  Widget pageBody(VerbGroup? verbGroup, context,
      VerbFormPageController controller, WidgetRef ref) {
    List<ConjugationResult> conjugationResuls = [];
    String title = "";
    String description = "";
    String exampleWord = "";

    switch (verbGroup) {
      case VerbGroup.godan:
        title = "???????? 1 (Godan)";
        exampleWord = "?????????";
        description =
            "???????? ???????????? ???????????? 5 ???????????????? '??' ???????????? ??????????????('???, ???, ???, ???, ???, ???, ???, ???, ???') ?????? ???????????? 1-?? ???????????????? ???? ???????? ?????????? ?????? ???? ????????. \n ???????????? 2-?? ???????????????? ???????????????????? ?????????? ?? 1-?? ?????????? ???????????????????????? ???????? ?????????? ??????: '?????????, ?????????, ??????, ?????????, ?????????, ??????, ????????????, ??????, ?????????' ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.godan, "oyo", "gu");

        break;
      case VerbGroup.ichidan:
        exampleWord = "?????????";
        title = "???????? 2 (ichidan)";
        description = "????????????????????? ???????????????????? ?????? ?????? 2-?? ?????????? ??????????????????????????. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.ichidan, "tabe", "ru");
        break;
      case VerbGroup.irregular:
        exampleWord = "?????????????????????";
        title = "???????? 3";
        description = "????????????????????? ???????????????????? ?????? ?????? 3-?? ?????????? ??????????????????????????. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.irregular, "benkyou", "suru");
        break;
      default:
        exampleWord = "??????";
        title = "???????? 3";
        description = "????????????????????? ???????????????????? ?????? ?????? 3-?? ?????????? ??????????????????????????. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.irregular, "", "kuru");
    }

    var lstWidgetVerbDexription = conjugationResuls
        .map(
          (verbResult) => WidgetVerbDescriptionWithEx(verbResult, verbGroup),
        )
        .toList();

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(description),
          const Divider(),
          Row(
            children: [
              const Text("??????????: "),
              Text(exampleWord),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: lstWidgetVerbDexription.length,
                  itemBuilder: (BuildContext context, int index) {
                    return lstWidgetVerbDexription[index].build(context, ref);
                  })),
        ],
      ),
    ));
  }
}

class WidgetVerbDescriptionWithEx extends HookConsumerWidget {
  WidgetVerbDescriptionWithEx(this.result, this.verbGroup, {Key? key})
      : super(key: key);
  final ConjugationResult result;

  final VerbGroup? verbGroup;
  final TextEditingController tecStartDay = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ConjugationResult> teFormGodan = [];
    List<Widget> lstDescriptionWidget = [];
    List<Widget> lstFormulaWidget = [];

    if (verbGroup != VerbGroup.ichidan) {
      if (result.conjName == "??? ????????????") {
        teFormGodan = getTeFormExamples();
      } else if (result.conjName == "??? ????????????") {
        teFormGodan = getTaFormExamples();
      }
      for (var e in teFormGodan) {
        lstDescriptionWidget.add(Text(e.desctiprion));
        lstFormulaWidget.add(Text(e.conjugatedVerb));
      }
    }
    lstDescriptionWidget.add(Text(result.desctiprion));
    lstFormulaWidget.add(Text("${result.conjugatedVerb} "));
    return Row(
      children: [
        Expanded(
          child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: lstDescriptionWidget,
                    ), //Text("${result.desctiprion} "),
                  )
                ],
              ),
              childrenPadding: const EdgeInsets.all(8.0),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: lstFormulaWidget,
                ),
              ] // [Text(result.conjugatedVerb), lstWidget],
              ),
        ),
      ],
    );
  }
}
