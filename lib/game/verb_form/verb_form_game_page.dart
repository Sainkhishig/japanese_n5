import 'package:afen_vocabulary/classes/counter_group.dart';
import 'package:afen_vocabulary/classes/verb_form.dart';
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/constant_value/common_constants.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_practice.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:translit/translit.dart';

import 'verb_form_page_controller.dart';

// import 'letter_card_page_controller.dart';
// import 'letter_type.dart';

class VerbFormGamePage extends HookConsumerWidget {
  VerbFormGamePage({Key? key}) : super(key: key);
  late N5Box lstN5;
  final trans = Translit();
  
    TextEditingController  tcVerb = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(verbFormGamePageProvider.notifier);
    controller.setModelListenable(ref);
    List<Widget> lsttableServings = [];
    
  var kanakit = KanaKit();
    // lsttableServings.add(tabCardBody(lstVerbForms, context, controller));

    var listDragItem = controller.state.lstVerbForms
        .map(
          (verbResult) => ConfugationResultForm(verbResult),
        )
        .toList();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Юмсыг тоолох нөхцөл"),
      // ),
      body: Column(
        children: [
          Row(children: [
          Container(
            width: 200,
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: tcVerb,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
            child: const Text("хувиргах"),
            onPressed: () async {
              VerbGroup group;
              var verb = tcVerb.text;
              var verbEnding = "";

              var verbKana =
                  kanakit.isRomaji(verb) ? verb.trim() : kanakit.toRomaji(verb);

              if (verbKana.endsWith("suru") || verbKana.endsWith("kuru")) {
                if (verbKana.endsWith("suru")) {
                  verbEnding = "suru";
                } else {
                  verbEnding = "kuru";
                }
                group = VerbGroup.irregular;
              } else if ((verbKana.endsWith("eru") ||
                      verbKana.endsWith("iru")) ||
                  lstIrregularGodan.contains(verbKana)) {
                if (verbKana.endsWith("eru")) {
                  verbEnding = "eru";
                } else {
                  verbEnding = "iru";
                }
                group = VerbGroup.ichidan;
              } else {
                lstGodanEnding.forEach((endGodan) {
                  if (verbKana.endsWith(kanakit.toRomaji(endGodan))) {
                    verbEnding = kanakit.toRomaji(endGodan);
                  }
                });
                group = VerbGroup.godan;
              }
              var verbRoot = verbKana.split(verbEnding)[0];
              List<ConjugationResult> conjugationResuls =
                  controller.conjugate(group, verbRoot, verbEnding);
              // verb.endsWith(other)
            },
          ),
          ],),
  //         SingleChildScrollView(
  // scrollDirection: Axis.vertical,
  // child: 
          Container(
            height: 500,
            width: 300,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
                // shrinkWrap: true,   
              itemCount: listDragItem.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return listDragItem[index].build(context, ref);
              })),
              // )
        ],
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


  Widget tabCardBody(VerbGroup? verbGroup, context, controller,WidgetRef ref) {
    List<ConjugationResult> conjugationResuls =[];
    String title="";
    switch (verbGroup) {
      case VerbGroup.godan:
        title = "Груп 1 (およぐ)";
        conjugationResuls=   controller.conjugate(VerbGroup.godan, "oyo", "gu");
        break;
      case VerbGroup.ichidan:
        title = "Груп 2 (たべる)";
        conjugationResuls=   controller.conjugate(VerbGroup.ichidan, "tabe", "ru");
        break;
      case VerbGroup.irregular:
        title = "Груп 3 (べんきょうする)";
        conjugationResuls=   controller.conjugate(VerbGroup.irregular, "benkyou", "suru");
        break;
      default:
        title = "Груп 3 (くる)";
        conjugationResuls=   controller.conjugate(VerbGroup.irregular, "", "kuru");
    }
               
                  
    var listDragItem = conjugationResuls
        .map(
          (verbResult) => ConfugationResultForm(verbResult),
        )
        .toList();

    return Card(
        child: Column(children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Divider(),
          Expanded (
          child:ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: listDragItem.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return listDragItem[index].build(context, ref);
                    }))],),);
  }
  

}

class ConfugationResultForm extends HookConsumerWidget {
  ConfugationResultForm(this.result, {Key? key}) : super(key: key);
  final ConjugationResult result;

  final TextEditingController tecStartDay = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Row(
              children: [
                
          Expanded( flex: 2,
            child: Text(
                  "${result.conjName}: ", style:const TextStyle(fontWeight: FontWeight.bold)),),
                
                // const SizedBox(width: 20),
                Expanded( flex: 4,
            child:
                Text(
                  "${result.conjugatedVerb}: "),)
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