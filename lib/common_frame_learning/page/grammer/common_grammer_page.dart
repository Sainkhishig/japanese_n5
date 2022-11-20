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
        return showErrorWidget(context, "Error card", snapshot.error);
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
    }

    List<XlGrammarHiveModel> filteredGrammar =
        hiveBox.lstGrammar.cast<XlGrammarHiveModel>();
    final DataTableSource _data = GrammarData(filteredGrammar);
    if (controller.state.searchKey.trim().isNotEmpty) {
      filteredGrammar = filteredGrammar
          .where((element) =>
              element.grammar.contains(controller.state.searchKey) ||
              element.meaningMn.contains(controller.state.searchKey))
          .toList();
    }
    lstGrammerPages.add(tabCardBody(filteredGrammar, context, controller));
    // }

    return Scaffold(
      body: Column(
        children: [
          CustomSearchBar(onSearch: (searchKey) {
            controller.setSearchKey(searchKey);
          }),
          PaginatedDataTable(
            source: _data,
            header: const Text('My Products'),
            columns: [
              DataColumn(label: Expanded(child: Center(child: Text('ID')))),
              DataColumn(label: Expanded(child: Center(child: Text('Name')))),
              DataColumn(label: Expanded(child: Center(child: Text('Price'))))
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
          // lstGrammerPages.isEmpty
          //     ? showEmptyDataWidget()
          //     : Expanded(
          //         child: PageView(
          //           controller: pageController,
          //           children: lstGrammerPages,
          //           onPageChanged: (value) {
          //             controller.setSelectedIndex(value);
          //           },
          //         ),
          //       )
        ],
      ),
      bottomNavigationBar: Container(
        height: lstGrammerPages.length > 1 ? 40 : 0,
        color: Colors.grey,
        child: Visibility(
          visible: lstGrammerPages.length > 1,
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
                    controller
                        .setSelectedIndex(pageController.page!.toInt() - 1);
                    pageController.animateToPage(
                        pageController.page!.toInt() - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(lstGrammerPages.isEmpty
                      ? " 0/0"
                      : " ${controller.state.selectedCardIndex}/${lstGrammerPages.length}")),
              IconButton(
                padding: const EdgeInsets.only(bottom: 4),
                iconSize: 40,
                disabledColor: Colors.grey,
                color: Colors.white,
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  if (pageController.page!.toInt() + 1 <
                      lstGrammerPages.length) {
                    controller
                        .setSelectedIndex(pageController.page!.toInt() + 1);
                    pageController.animateToPage(
                        pageController.page!.toInt() + 1,
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
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lst.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      lst[index].grammar,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      lst[index].meaningMn,
                                    ),
                                  ),
                                  // Text(
                                ],
                              ),
                            ));
                      }))
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
