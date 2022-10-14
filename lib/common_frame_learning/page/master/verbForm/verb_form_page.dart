import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/common_frame_learning/page/verb_conjugation/conjugation_constant.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'verb_form_page_controller.dart';

class VerbFormPage extends HookConsumerWidget {
  VerbFormPage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(verbFormPageProvider.notifier);
    controller.setModelListenable(ref);

    List<Widget> lsttableServings = [];

    // lsttableServings.add(tabCardBody(lstVerbForms, context, controller));

    for (var element in [
      VerbGroup.godan,
      VerbGroup.ichidan,
      VerbGroup.irregular,
      null
    ]) {
      lsttableServings.add(tabCardBody(element, context, controller, ref));
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("ҮҮ нөхцөл"),
      // ),
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

  Widget tabCardBody(VerbGroup? verbGroup, context,
      VerbFormPageController controller, WidgetRef ref) {
    List<ConjugationResult> conjugationResuls = [];
    String title = "";
    String description = "";
    String exampleWord = "";

    switch (verbGroup) {
      case VerbGroup.godan:
        title = "Груп 1 (Godan)";
        exampleWord = "およぐ";
        description =
            "Япон хэлний үндсэн 5 эгшигийн 'Ү' мөрөөр төгссөн('う, つ, る, む, ぶ, ぬ, く, ぐ, す') үйл үгсийг 1-р группийн үг буюу Годан үйл үг гэнэ. \n ※　Мөн 2-р группийн төгсгөлтэй хэдий ч 1-р групт харъяалагдах цөөн тооны үгс: 'はいる, はしる, いる, かえる, かぎる, きる, しゃべる, しる, つくる' ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.godan, "oyo", "gu");

        break;
      case VerbGroup.ichidan:
        exampleWord = "たべる";
        title = "Груп 2 (ichidan)";
        description = "～える、～いる төгсгөлтэй бүх үгс 2-р групт харъяалагдана. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.ichidan, "tabe", "ru");
        break;
      case VerbGroup.irregular:
        exampleWord = "べんきょうする";
        title = "Груп 3";
        description = "～くる、～する төгсгөлтэй бүх үгс 3-р групт харъяалагдана. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.irregular, "benkyou", "suru");
        break;
      default:
        exampleWord = "くる";
        title = "Груп 3";
        description = "～くる、～する төгсгөлтэй бүх үгс 3-р групт харъяалагдана. ";
        conjugationResuls =
            controller.conjugateVerb(VerbGroup.irregular, "", "kuru");
    }

    var listDragItem = conjugationResuls
        .map(
          (verbResult) => ConfugationInfoForm(verbResult, verbGroup),
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
              const Text("Жишээ: "),
              Text(exampleWord),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listDragItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listDragItem[index].build(context, ref);
                  })),
        ],
      ),
    ));
  }
}

class ConfugationInfoForm extends HookConsumerWidget {
  ConfugationInfoForm(this.result, this.verbGroup, {Key? key})
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
      if (result.conjName == "て хэлбэр") {
        teFormGodan = getTeFormExamples();
      } else if (result.conjName == "た хэлбэр") {
        teFormGodan = getTaFormExamples();
      }
      for (var e in teFormGodan) {
        lstDescriptionWidget.add(Text(e.desctiprion));
        lstFormulaWidget.add(Text(e.conjugatedVerb));
      }
    } else {
      lstDescriptionWidget.add(Text(result.desctiprion));
      lstFormulaWidget.add(Text("${result.conjugatedVerb} "));
    }
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
