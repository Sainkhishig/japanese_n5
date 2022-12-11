import 'dart:math';

import 'package:hishig_erdem/common/app_function.dart';
import 'package:hishig_erdem/common/common_enum.dart';
import 'package:hishig_erdem/common_frame_practice/api/tes_api.dart';
import 'package:hishig_erdem/common_frame_practice/grammar/test/grammar_test_state.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/main/login_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final grammarTestController =
    StateNotifierProvider<GrammarTestController, GrammarTestState>(
        (ref) => GrammarTestController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class GrammarTestController extends StateNotifier<GrammarTestState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  late LoginState loginState;
  Random randomVerbToExercise = Random();

  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {
    ref.watch(grammarTestController);
  }

  //#region ==================== constructor ====================
  GrammarTestController({required this.ref}) : super(const GrammarTestState()) {
    prefs = ref.read(sharedPreferencesProvider);
    loginState = ref.read(loginStateNotifierProvider);
  }

  //#endregion ==================== constructor ====================

  Future<void> setGrammarList() async {
    var lstGrammarTest =
        await CommonTestAPI().getGrammarTest(prefs.getInt("jlptLevel") ?? 5);
    if (lstGrammarTest.isNotEmpty) {
      var selectedTesIndex =
          loginState.loggedIn ? 0 : getSlectedTestIndex(lstGrammarTest);
      state = state.copyWith(
          grammarTestSource: lstGrammarTest,
          selectedTestIndex: selectedTesIndex);
    } else {
      state = state.copyWith(grammarTestSource: [], selectedTestIndex: 0);
    }
  }

  Future<void> sendTestResult(testResult) async {
    final newData = <String, dynamic>{
      'userId': prefs.getString("userId"),
      'jlptLevel': prefs.getInt("jlptLevel"),
      'test': TestType.grammar.id,
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
  GrammarTestState get testState => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const GrammarTestState();

  changeTest() {
    var selectedIndex =
        loginState.loggedIn ? getSlectedTestIndex(state.grammarTestSource) : 0;
    if (loginState.isUserPlanActive) {
      selectedIndex =
          (state.grammarTestSource.length - 1) == state.selectedTestIndex
              ? 0
              : state.selectedTestIndex + 1;
    }
    state = state.copyWith(selectedTestIndex: selectedIndex);
  }
  //#endregion ==================== method ====================
}
