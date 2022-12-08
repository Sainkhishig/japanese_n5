import 'package:firebase_database/firebase_database.dart';
import 'package:hishig_erdem/common_frame_practice/common_model/test_result_model.dart';
import 'package:hishig_erdem/common_frame_practice/grammar/model/grammar_model.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';
import 'package:hishig_erdem/common_frame_practice/reading/model/reading_test_model.dart';
import 'package:hishig_erdem/common_frame_practice/vocabulary/model/vocabulary_model.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/popup_menu_pages/user_info/model/plan_model.dart';

class CommonTestAPI {
  final _database = FirebaseDatabase.instance.reference();

  Future<List> getKanjiTest(level) async {
    var ref = _database.child("/KanjiTest");
    var kanjiDb = await ref.orderByChild("jlptLevel").equalTo(level).once();
    if (kanjiDb.value == null) return [];
    final rtdb = Map<String, dynamic>.from(kanjiDb.value);
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
    var vocDb = await ref.orderByChild("jlptLevel").equalTo(level).once();
    if (vocDb.value == null) return [];
    final rtdb = Map<String, dynamic>.from(vocDb.value);
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
    if (masterCategoryDB.value == null) return [];
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
    if (rtdb.value == null) return [];
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
    if (rtdb.value == null) return [];
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);
    var lstTest = [];
    rtdbVal.forEach((keyUser, value) {
      final grammarTest =
          ReadingTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(grammarTest);
    });
    return lstTest;
  }

  Future<List<TestResultModel>> getReadingTestResult(userId, level) async {
    var ref = _database.child("/UserTestResult");
    var rtdb = await ref.orderByChild("userId").equalTo(userId).once();

    if (rtdb.value == null) return [];
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);

    List<TestResultModel> lstTest = [];
    rtdbVal.forEach((keyUser, value) {
      final testResult =
          TestResultModel.fromRTDB(Map<String, dynamic>.from(value));
      lstTest.add(testResult);
    });

    return lstTest.where((element) => element.jlptLevel == level).toList();
  }

  Future<List> getPlanInfo(userId, level) async {
    var ref = _database.child("/UserPlan");
    var planData = await ref.orderByChild("userId").equalTo(level).once();

    if (planData.value == null) return [];
    final rtdb = Map<String, dynamic>.from(planData.value);
    List<PlanModel> lstPlan = [];
    rtdb.forEach((keyUser, value) {
      if (value != null) {
        final kanjiTest = PlanModel.fromRTDB(Map<String, dynamic>.from(value));
        lstPlan.add(kanjiTest);
      }
    });
    var dateLimit = DateTime.now().add(Duration(days: -1));
    var lstResult = lstPlan
        .where((element) =>
            element.isApproved &&
            element.level == level &&
            element.endDate.isAfter(dateLimit))
        .toList();
    return lstResult;
  }

  Future<bool> setPlanInfo(LoginState loginState) async {
    int level = loginState.hiveInfo.jlptLevel;
    var ref = _database.child("/UserPlan");
    var planData =
        await ref.orderByChild("userId").equalTo(loginState.userId).once();
    if (planData.value == null) return false;
    final rtdb = Map<String, dynamic>.from(planData.value);
    List<PlanModel> lstPlan = [];
    rtdb.forEach((keyUser, value) {
      if (value != null) {
        final kanjiTest = PlanModel.fromRTDB(Map<String, dynamic>.from(value));
        lstPlan.add(kanjiTest);
      }
    });
    var dateLimit = DateTime.now().add(Duration(days: -1));
    var lstResult = lstPlan
        .where((element) =>
            element.isApproved &&
            element.level == level &&
            element.endDate.isAfter(dateLimit))
        .toList();
    loginState.isUserPlanActive = lstResult.isNotEmpty;
    if (lstResult.isNotEmpty) {
      loginState.lstUserPlan = lstResult;
    }
    return lstResult.isNotEmpty;
  }
}
