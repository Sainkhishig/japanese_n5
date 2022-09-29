import 'package:afen_vocabulary/common/common_widget.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'import_vocabulary_page_controller.dart';

class ImportVocabularyPage extends HookConsumerWidget {
  ImportVocabularyPage({Key? key}) : super(key: key);
  // late List<JLPTLevel> listLevel = [];
  late N5Box lstN5;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var kanaKit = ();

    // final _database = FirebaseDatabase.instance.reference();
    // PageController pageController = PageController(
    //   initialPage: 0,
    //   keepPage: true,
    // );

    final controller = ref.watch(vocabularyCardProvider.notifier);
    lstN5 = ref.read(n5BoxDataProvider);
    var lstWord = lstN5.box.values.toList();

    useEffect(() {
      // readExcelFile("Vocabulary_of_JLPT_N5");
      // for (var level in [5, 4, 3, 2, 1]) {
      //   listLevel.add(JLPTLevel(level, "N$level"));
      // }
    }, const []);
    controller.setModelListenable(ref);
    // var preferences = ref.read(sharedPreferencesProvider);
    final future = useMemoized(() => controller.getTableAllocationByDate("5"));
    final snapshot = useFuture(future, initialData: null);
    if (snapshot.hasError) {
      return showErrorWidget(context, "Error card", snapshot.error);
    }
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary"),
        actions: <Widget>[],
      ),
      body: Scaffold(
          body: ElevatedButton(
        onPressed: () {
          controller.save().then((value) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text(
                      "Алдаа",
                      style: TextStyle(fontSize: 14),
                    ),
                    content: const Text(
                      "saved",
                      style: TextStyle(color: Colors.red),
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "OK",
                          // style: boldText(color: color),
                        ),
                        onPressed: () {
                          // callback;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )));
        },
        child: const Text("Import"),
      )),
    );
  }

  Widget tabCardBody(Dictionary currentWord, context, controller) {
    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 800,
            frontWidget: Container(
                child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      currentWord.word,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
                Expanded(flex: 1, child: Text(currentWord.example))
              ],
            )),
            backWidget: Container(
                child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      currentWord.translate,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
                Expanded(flex: 1, child: Text(currentWord.exampleTr))
              ],
            ))));
  }
}

class JLPTLevel {
  late int _id;
  late String _name;

  JLPTLevel(this._id, this._name);

  String get name => _name;

  int get id => _id;
}
