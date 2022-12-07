import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/common/hive_model/grammar/xl_grammar_hive_model.dart';
import 'package:hishig_erdem/common/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translit/translit.dart';

import 'common_grammer_page_controller.dart';

class CommonGrammerPage extends HookConsumerWidget {
  CommonGrammerPage({Key? key}) : super(key: key);

  final trans = Translit();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    List<Widget> lstGrammerPages = [];

    final controller = ref.watch(commonGrammerPageProvider.notifier);
    controller.setModelListenable(ref);

    final loginState = ref.watch(loginStateNotifierProvider.notifier);
    final hiveBox = controller.getHiveBox(loginState.hiveInfo.jlptLevel);

    if (hiveBox.lstGrammar == null || hiveBox.lstGrammar.isEmpty) {
      final future = useMemoized(() => readXlGrammar(ref));
      final snapshot = useFuture(future, initialData: null);
      if (snapshot.hasError) {
        return showErrorWidget(context, "Алдаа гарлаа", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }

    List<XlGrammarHiveModel> lstAllVocabulary =
        hiveBox.lstGrammar.cast<XlGrammarHiveModel>();

    var searchKey = controller.state.searchKey.trim();

    if (searchKey.isNotEmpty) {
      lstAllVocabulary = lstAllVocabulary
          .where((element) =>
              element.grammar.contains(searchKey) ||
              element.meaningMn.contains(searchKey))
          .toList();
    }
    lstGrammerPages.add(tabCardBody(lstAllVocabulary, context, controller));
    // }

    return Scaffold(
      body: Column(
        children: [
          CustomSearchBar(
              searchKey: controller.state.searchKey,
              onClear: () {
                controller.setSearchKey("");
              },
              onSearch: (searchKey) {
                controller.setSearchKey(searchKey);
              }),
          // PaginatedDataTable(
          //   source: _data,
          //   header: const Text('My Products'),
          //   columns: [
          //     DataColumn(label: Expanded(child: Center(child: Text('ID')))),
          //     DataColumn(label: Expanded(child: Center(child: Text('Name')))),
          //     DataColumn(label: Expanded(child: Center(child: Text('Price'))))
          //   ],
          //   columnSpacing: 100,
          //   horizontalMargin: 10,
          //   rowsPerPage: 8,
          //   showCheckboxColumn: false,
          // ),
          lstGrammerPages.isEmpty
              ? showEmptyDataWidget()
              : Expanded(
                  child: PageView(
                    controller: pageController,
                    children: lstGrammerPages,
                    onPageChanged: (value) {
                      controller.setSelectedIndex(value);
                    },
                  ),
                )
        ],
      ),
    );
  }

  Widget tabCardBody(List<XlGrammarHiveModel> lst, context, controller) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: lst.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext ctx, index) {
                  XlGrammarHiveModel grammarData = lst[index];
                  return ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${++index}. ${grammarData.grammar}",
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              grammarData.meaningMn,
                            ),
                          ),
                          // Text(
                        ],
                      ),
                      childrenPadding: const EdgeInsets.all(8.0),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Томъёо:"),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  grammarData.formMn.replaceAll("※", "\n")),
                            ),
                            // Text(
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text("Жишээ:"),
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    EasyRichText(
                                      grammarData.example1,
                                      patternList: [
                                        ///bold font
                                        EasyRichTextPattern(
                                          targetString: '(\\*)(.*?)(\\*)',
                                          matchBuilder: (context, match) {
                                            return TextSpan(
                                              text: match![0]!
                                                  .replaceAll('*', ''),
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(grammarData.example1Mn),
                                  ],
                                )),
                            // Text(
                          ],
                        ),
                      ] // [Text(result.conjugatedVerb), lstWidget],
                      );
                },
                // separatorBuilder: (BuildContext context, int index) {},
              ))
            ]));
  }
}

class GrammarData extends DataTableSource {
  final List<XlGrammarHiveModel> listGrammar;
  GrammarData(this.listGrammar);
  // Generate some made-up data
  // final List<Map<String, dynamic>> _data = List.generate(
  //     200,
  //     (index) => {
  //           "id": index,
  //           "title": "Item $index",
  //           "price": Random().nextInt(10000)
  //         });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => listGrammar.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(listGrammar[index].grammar.toString())])),
      DataCell(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(listGrammar[index].meaningMn)])),
      DataCell(Text(listGrammar[index].formMn.toString())),
    ]);
  }
}
