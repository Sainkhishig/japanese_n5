import 'package:firebase_database/firebase_database.dart';
import 'package:hishig_erdem/common_frame_practice/grammar/model/grammar_model.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';
import 'package:hishig_erdem/common_frame_practice/reading/model/reading_test_model.dart';
import 'package:hishig_erdem/common_frame_practice/vocabulary/model/vocabulary_model.dart';
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

  Future<List> getVocabularyTest(level) async {
    var ref = _database.child("/VocabularyTest");
    var masterCategoryDB =
        await ref.orderByChild("jlptLevel").equalTo(level).once();

    final rtdb = Map<String, dynamic>.from(masterCategoryDB.value);
    var lstTest = [];
    rtdb.forEach((keyUser, value) {
      final vocabularyTest =
          VocabularyTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(vocabularyTest);
    });
    return lstTest;
  }

  Future<List<ListeningTest>> getListeningTest(level) async {
    var ref = _database.child("/ListeningTest");
    var masterCategoryDB =
        await ref.orderByChild("jlptLevel").equalTo(level).once();

    final categoryDB = Map<String, dynamic>.from(masterCategoryDB.value);
    List<ListeningTest> lstTest = [];
    categoryDB.forEach((keyUser, value) {
      final listeningTest =
          ListeningTest.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(listeningTest);
    });
    print("lengthListening:${lstTest.length}");
    return lstTest;
  }

  Future<List> getGrammarTest(level) async {
    var ref = _database.child("/GrammarTest");
    var rtdb = await ref.orderByChild("jlptLevel").equalTo(level).once();

    final categoryDB = Map<String, dynamic>.from(rtdb.value);
    var lstTest = [];
    categoryDB.forEach((keyUser, value) {
      final grammarTest =
          GrammarTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(grammarTest);
    });
    return lstTest;
  }

  Future<List> getReadingTest(level) async {
    var ref = _database.child("/ReadingTest");
    var rtdb = await ref.orderByChild("jlptLevel").equalTo(level).once();

    final categoryDB = Map<String, dynamic>.from(rtdb.value);
    var lstTest = [];
    categoryDB.forEach((keyUser, value) {
      final grammarTest =
          ReadingTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(grammarTest);
    });
    return lstTest;
  }
}
