import 'dart:math';

import 'package:hishig_erdem/common_frame_practice/api/tes_api.dart';
import 'package:hishig_erdem/common_frame_practice/reading/test/reading_test_state.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final readingTestController =
    StateNotifierProvider<ReadingTestController, ReadingTestState>(
        (ref) => ReadingTestController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class ReadingTestController extends StateNotifier<ReadingTestState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(readingTestController);
  }

  //#region ==================== constructor ====================
  ReadingTestController({required this.ref}) : super(const ReadingTestState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }

  //#endregion ==================== constructor ====================

  Future<void> setReadingList() async {
    print("loading data...");
    var lstReadingTest =
        await CommonTestAPI().getReadingTest(prefs.getInt("jlptLevel") ?? 5);
    var randomTest =
        lstReadingTest[randomVerbToExercise.nextInt(lstReadingTest.length)];

    state = state.copyWith(
        readingTestSource: lstReadingTest, selectedReadingTest: randomTest);
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
  ReadingTestState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const ReadingTestState();

  changeTest() {
    print("setNextTest");
    var randomTest = state.readingTestSource[
        randomVerbToExercise.nextInt(state.readingTestSource.length)];
    state = state.copyWith(selectedReadingTest: randomTest);
  }
  //#endregion ==================== method ====================
}
