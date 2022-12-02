import 'dart:math';

import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/n5/test/api/tes_api.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final kanjiTestController =
    StateNotifierProvider<KanjiTestController, KanjiTestState>(
        (ref) => KanjiTestController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class KanjiTestController extends StateNotifier<KanjiTestState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(kanjiTestController);
  }

  //#region ==================== constructor ====================
  KanjiTestController({required this.ref}) : super(const KanjiTestState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }

  //#endregion ==================== constructor ====================

  Future<void> setKanjiList() async {
    print("loading data...");
    var lstKanjiTest =
        await CommonTestAPI().getKanjiTest(prefs.getInt("jlptLevel") ?? 5);
    var randomTest =
        lstKanjiTest[randomVerbToExercise.nextInt(lstKanjiTest.length)];

    state = state.copyWith(
        kanjiTestSource: lstKanjiTest, selectedKanjiTest: randomTest);
  }

  Future<void> sendTestResult(testResult) async {
    final newData = <String, dynamic>{
      'userId': prefs.getString("userId"),
      'jlptLevel': prefs.getInt("jlptLevel"),
      'test': "KANJI",
      'result': testResult,
      'testDate': DateTime.now().microsecondsSinceEpoch,
    };

    await _database
        .child('UserTestResult')
        .push()
        .set(newData)
        .catchError((onError) {
      print('could not send data');
      throw ("aldaa garlaa");
    });
  }

  //#region ==================== accessor ====================
  KanjiTestState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const KanjiTestState();

  changeTest() {
    print("setNextTest");
    var randomTest = state.kanjiTestSource[
        randomVerbToExercise.nextInt(state.kanjiTestSource.length)];
    state = state.copyWith(selectedKanjiTest: randomTest);
  }
  //#endregion ==================== method ====================
}
