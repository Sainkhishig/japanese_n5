
import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/page/verb_conjugation/conjugation_constant.dart';
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

    for (var element in [VerbGroup.godan, VerbGroup.ichidan, VerbGroup.irregular,null]) {
      lsttableServings.add(tabCardBody(element, context, controller,ref));
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
          (verbResult) => ConfugationInfoForm(verbResult),
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


class ConfugationInfoForm extends HookConsumerWidget {
  ConfugationInfoForm(this.result, {Key? key}) : super(key: key);
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
                  "${result.conjName}: ", style:TextStyle(fontWeight: FontWeight.bold)),),
                
                // const SizedBox(width: 20),
                Expanded( flex: 4,
            child:
                Text(
                  "${result.desctiprion}: "),)
              ],
            ),
            
            childrenPadding: const EdgeInsets.all(8.0),
            children: [Text(result.conjugatedVerb)],
          ),
        ),
      ],
    );
  }
}
