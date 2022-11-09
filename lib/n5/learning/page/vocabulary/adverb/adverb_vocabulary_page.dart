// import 'package:hishig_erdem/common/app_function.dart';
// import 'package:hishig_erdem/common/common_widget.dart';
// import 'package:hishig_erdem/common/search_bar.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:translit/translit.dart';

// import 'adverb_vocabulary_page_controller.dart';

// class AdverbVocabularyPage extends HookConsumerWidget {
//   AdverbVocabularyPage({Key? key}) : super(key: key);

//   final trans = Translit();
//   final keywordController = TextEditingController();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     PageController pageController = PageController(
//       initialPage: 0,
//       keepPage: true,
//     );

//     useEffect(() {}, const []);

//     final controller = ref.watch(vocListProvider.notifier);
//     controller.setModelListenable(ref);
//     // controller.loadCSV();
//     // var lstN5db = ref.read(n5BoxDataProvider);
//     // var lstVocabul = lstN5db.box.get("N5Words");
//     // if (lstVocabul == null || lstVocabul.isEmpty) {
//     final future = useMemoized(() => controller.loadCSV());
//     final snapshot = useFuture(future, initialData: null);
//     if (snapshot.hasError) {
//       return showErrorWidget(context, "Error card", snapshot.error);
//     }
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     // }
//     List<Widget> lsttableServings = [];
//     // lstVocabul = lstN5db.box.get("N5Words");
//     var filteredGrammar = controller.state.lstVocabulary;
//     if (controller.state.searchKey.trim().isNotEmpty) {
//       filteredGrammar = controller.state.lstVocabulary
//           .where((element) =>
//               element.word.contains(controller.state.searchKey) ||
//               element.translate.contains(controller.state.searchKey))
//           .toList();
//     }

//     if (filteredGrammar.isNotEmpty) {
//       lsttableServings.add(tabCardBody(filteredGrammar, context, controller));
//     }
//     return Scaffold(
//       body: Scaffold(
//           body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
//               Column(children: [
//         CustomSearchBar(onSearch: (searchKey) {
//           controller.setSearchKey(searchKey);
//         }),
//         lsttableServings.isEmpty
//             ? showEmptyDataWidget()
//             : Expanded(
//                 child: PageView(
//                   controller: pageController,
//                   children: lsttableServings,
//                   onPageChanged: (value) {
//                     controller.setSelectedIndex(value);
//                   },
//                 ),
//               )
//       ])),
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
//             child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: lst.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   var hiragana = "${lst[index].word}".isEmpty
//                       ? ""
//                       : "\n${lst[index].word}";
//                   return Padding(
//                       padding: const EdgeInsets.all(2),
//                       child: Container(
//                         // padding: const EdgeInsets.all(5),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 1,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Visibility(
//                               visible: controller.isShowPreference ?? true,
//                               child: IconButton(
//                                 onPressed: () {
//                                   speak(lst[index].word);
//                                 },
//                                 icon: const Icon(Icons.volume_up),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Text("${lst[index].kanji}$hiragana"),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Text(
//                                 "${lst[index].translate}",
//                               ),
//                             ),
//                             // Text(
//                           ],
//                         ),
//                       ));
//                 }))
//       ],
//     ));
//   }
// }
