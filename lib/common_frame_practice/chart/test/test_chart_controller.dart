import 'dart:math';

import 'package:hishig_erdem/common_frame_practice/chart/test/test_chart_state.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final testChartController =
    StateNotifierProvider<TestChartController, TestChartState>(
        (ref) => TestChartController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class TestChartController extends StateNotifier<TestChartState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(testChartController);
  }

  //#region ==================== constructor ====================
  TestChartController({required this.ref}) : super(const TestChartState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }

  //#endregion ==================== constructor ====================

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
  TestChartState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const TestChartState();

  //#endregion ==================== method ====================
}
