import 'package:firebase_database/firebase_database.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/listening/model/listening_test_model.dart';

class CommonTestAPI {
  final _database = FirebaseDatabase.instance.reference();

  Future<List> getKanjiTest(level) async {
    var ref = _database.child("/KanjiTest");
    var masterCategoryDB =
        await ref.orderByChild("jlptLevel").equalTo(level).once();

    final rtdb = Map<String, dynamic>.from(masterCategoryDB.value);
    var lstKanjiTest = [];
    rtdb.forEach((keyUser, value) {
      final kanjiTest =
          KanjiTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstKanjiTest.add(kanjiTest);
    });
    return lstKanjiTest;
  }

  // Future<List> getVocabularyTest(level) async {
  //   var ref = _database.child("/VocabularyTest");
  //   var masterCategoryDB =
  //       await ref.orderByChild("jlptLevel").equalTo(level).once();

  //   final rtdb = Map<String, dynamic>.from(masterCategoryDB.value);
  //   var lstTest = [];
  //   rtdb.forEach((keyUser, value) {
  //     final vocabularyTest =
  //         VocabularyTestModel.fromRTDB(Map<String, dynamic>.from(value));
  //     lstTest.add(listeningTest);
  //   });
  //   return lstTest;
  // }

  Future<List> getListeningTest(level) async {
    var ref = _database.child("/ListeningTest");
    var masterCategoryDB =
        await ref.orderByChild("jlptLevel").equalTo(level).once();

    final categoryDB = Map<String, dynamic>.from(masterCategoryDB.value);
    var lstTest = [];
    categoryDB.forEach((keyUser, value) {
      final listeningTest =
          ListeningTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(listeningTest);
    });
    return lstTest;
  }

  // Future<List> getGrammarTest(level) async {
  //   var ref = _database.child("/GrammarTest");
  //   var rtdb = await ref.orderByChild("jlptLevel").equalTo(level).once();

  //   final categoryDB = Map<String, dynamic>.from(rtdb.value);
  //   var lstTest = [];
  //   categoryDB.forEach((keyUser, value) {
  //     final grammarTest =
  //         GrammarTestModel.fromRTDB(Map<String, dynamic>.from(value));
  //     lstTest.add(grammarTest);
  //   });
  //   return lstTest;
  // }
}
