// import 'package:afen_vocabulary/common/common_widget.dart';

// import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:translit/translit.dart';

// import 'vocabulary_list_page_controller.dart';

// class VocabularyListPage extends HookConsumerWidget {
//   VocabularyListPage({Key? key}) : super(key: key);

//   final trans = Translit();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     PageController pageController = PageController(
//       initialPage: 0,
//       keepPage: true,
//     );

//     final controller = ref.watch(vocListProvider.notifier);
//     // lstN5 = ref.read(n5BoxDataProvider);
//     // var lstWord = lstN5.box.values.toList();

//     // useEffect(() {
//     //   for (var level in [5, 4, 3, 2, 1]) {
//     //     listLevel.add(JLPTLevel(level, "N$level"));
//     //   }
//     // }, const []);
//     controller.setModelListenable(ref);
//     // // var preferences = ref.read(sharedPreferencesProvider);
//     // final future = useMemoized(() => controller.getTableAllocationByDate("5"));
//     // final snapshot = useFuture(future, initialData: null);
//     // if (snapshot.hasError) {
//     //   return showErrorWidget(context, "Error card", snapshot.error);
//     // }
//     // if (!snapshot.hasData) {
//     //   return const Center(child: CircularProgressIndicator());
//     // }
//     var lstN5db = ref.read(n5BoxDataProvider);
//     var lstVocabul = lstN5db.box.get("N5Words");
//     List<Widget> lsttableServings = [];
//     if (lstVocabul.isNotEmpty) {
//       lsttableServings.add(tabCardBody(lstVocabul, context, controller));
//     }
//     return Scaffold(
//       body: Scaffold(
//         body: lsttableServings.isEmpty
//             ? showEmptyDataWidget()
//             : //Expanded(child: FlashCardListItem(flashcards: flashCard)),

//             PageView(
//                 controller: pageController,
//                 children: lsttableServings,
//                 onPageChanged: (value) {
//                   controller.setSelectedIndex(value);
//                 },
//               ),
//       ),
//       bottomNavigationBar: Container(
//         height: 40,
//         color: Colors.grey,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               padding: const EdgeInsets.only(bottom: 4),
//               iconSize: 40,
//               disabledColor: Colors.grey,
//               color: Colors.white,
//               icon: const Icon(Icons.chevron_left),
//               onPressed: () {
//                 if (pageController.page!.toInt() > 0) {
//                   controller.setSelectedIndex(pageController.page!.toInt() - 1);
//                   pageController.animateToPage(pageController.page!.toInt() - 1,
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.ease);
//                 }
//               },
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Text(lsttableServings.isEmpty
//                     ? " 0/0"
//                     : " ${controller.state.selectedCardIndex}/${lsttableServings.length}")),
//             IconButton(
//               padding: const EdgeInsets.only(bottom: 4),
//               iconSize: 40,
//               disabledColor: Colors.grey,
//               color: Colors.white,
//               icon: const Icon(Icons.chevron_right),
//               onPressed: () {
//                 if (pageController.page!.toInt() + 1 <
//                     lsttableServings.length) {
//                   controller.setSelectedIndex(pageController.page!.toInt() + 1);
//                   pageController.animateToPage(pageController.page!.toInt() + 1,
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.ease);
//                 } else if (pageController.page!.toInt() != 0) {
//                   controller.setSelectedIndex(0);
//                   pageController.animateToPage(0,
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.ease);
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget tabCardBody(List lst, context, controller) {
//     // var currentLetter = lstVoc as List<Dictionary>;
//     return Card(
//         child: Column(
//       children: [
//         Expanded(
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 30, right: 30),
//                 child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       // childAspectRatio: 3 / 2,
//                       crossAxisSpacing: 2,
//                       mainAxisSpacing: 2,
//                       crossAxisCount: 1,
//                       mainAxisExtent: MediaQuery.of(context).size.height / 12,
//                     ),
//                     itemCount: lst.length,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 1,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   lst[index].word,
//                                 ),
//                               ),
//                             ),
//                             //  Expanded(
//                             //   flex: 1,
//                             //   child: Container(
//                             //     alignment: Alignment.center,
//                             //     child: Text(
//                             //       lst[index].kanji,
//                             //     ),
//                             //   ),
//                             // ),
//                             Expanded(
//                               flex: 2,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   lst[index].translate,
//                                 ),
//                               ),
//                             ),
//                             // Text(
//                           ],
//                         ),
//                       );
//                     })))
//       ],
//     ));

//     // Center(
//     //   child: Card(
//     //     elevation: 4.0,
//     //     child: Column(
//     //       children: [
//     //         Text(currentLetter.name),
//     //         Expanded(
//     //             flex: 3,
//     //             child: Center(
//     //               child: GridView.builder(
//     //                 itemCount: currentLetter.lstLetter.length,
//     //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //                   crossAxisCount: 5,
//     //                   mainAxisExtent: MediaQuery.of(context).size.height / 12,
//     //                 ),
//     //                 itemBuilder: (BuildContext context, int index) {
//     //                   return Padding(
//     //                       padding: const EdgeInsets.all(1),
//     //                       child: Row(children: [
//     //                         Container(
//     //                           decoration: BoxDecoration(
//     //                             border: Border.all(
//     //                               color: Colors.black,
//     //                               width: 2,
//     //                             ),
//     //                           ),
//     //                           child: Text(
//     //                             currentLetter.lstLetter[index],
//     //                             style: const TextStyle(color: Colors.black),
//     //                           ),
//     //                         )
//     //                       ]));
//     //                 },
//     //               ),
//     //             )),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
