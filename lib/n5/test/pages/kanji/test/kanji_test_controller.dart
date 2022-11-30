import 'dart:convert';

import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_state.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
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
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  KanjiTestController({required this.ref}) : super(const KanjiTestState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }

  //#endregion ==================== constructor ====================
  late SharedPreferences prefs;
  Future<void> getKanjiTest() async {
    var masterCategoryDB = await _database
        .child('KanjiTest')
        // .orderByChild("jlptLevel")
        // .equalTo(prefs.getInt("jlptLevel") ?? 5)
        .get();
    final categoryDB = Map<String, dynamic>.from(masterCategoryDB.value);
    var lstKanjiTest = [];
    categoryDB.forEach((keyUser, value) {
      final kanjiTest =
          KanjiTestModel.fromRTDB(Map<String, dynamic>.from(value));
      lstKanjiTest.add(kanjiTest);
    });
    state = state.copyWith(kanjiTestSource: lstKanjiTest);
    // await masterDB.box.put("KanjiTest", lstKanjiTest);
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
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }

  //#region ==================== accessor ====================
  KanjiTestState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const KanjiTestState();

  Future<KanjiTestState?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  Future<bool> save(KanjiTestModel detail) async {
    try {
      String query = r'''
         mutation saveFacilityPlan($facilityId:ID!,$input: FacilityPlanInput) {
          saveFacilityPlan: saveFacilityPlan(facilityId:$facilityId,
          input: $input
          ) {
            id
        facilityId
        checkInStartTime
        lastModifiedDate
          }
        }
      ''';

      // final response = await GraphqlClient().executeMutationByOption(options);

      return true;
    } catch (e) {
      // TODO: INTERNAL_ERROR, NOT_FOUND
      print(e);
      return false;
    }
  }

  void update() {
    var _todoQuery = _database.child("/category");
    _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
      'age': '29',
      'email': 'updari.ariuka67@gmail.com',
      'mobile': '07083539202',
      'name': 'Sainkhishig Ariunaa',
      'time': DateTime.now().microsecondsSinceEpoch
    });
  }

  // void updateCounter(int count) {
  //   var _todoQuery = _database.child("/counter");
  //   _todoQuery.set(count++);
  // }

  void write(KanjiTestModel detail) {
    // var _todoQuery = _database.child("/category");

    // final newData = <String, dynamic>{
    //   'code': detail.code,
    //   'name': detail.name,
    //   'time': DateTime.now().microsecondsSinceEpoch
    // };
    // _database
    //     .child('category')
    //     .push()
    //     .set(newData)
    //     .then((value) => {
    //           print('new data written'),
    //         })
    //     .catchError((onError) => print('could not saved data'));
  }

  // void write(KanjiModel detail) {
  //   // var _todoQuery = _database.child("/category");
  //   _database.child('counter').once().then((DataSnapshot snapshot) {
  //     print('Connected to second database and read ${snapshot.value}');
  //     var count = snapshot.value;
  //     final newData = <String, dynamic>{
  //       'code': detail.code,
  //       'name': detail.name,
  //       'time': DateTime.now().microsecondsSinceEpoch
  //     };
  //     _database
  //         .child('category')
  //         .push()
  //         .set(newData)
  //         .then((value) =>
  //             {print('new data written'), updateCounter(int.parse(count))})
  //         .catchError((onError) => print('could not saved data'));
  //   });

  //   // var _todoQuery = _database.child("/user1");
  //   // _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
  //   //   'age': '29',
  //   //   'email': 'ari.ariuka67@gmail.com',
  //   //   'mobile': '07083539202',
  //   //   'name': 'Sainkhishig Ariunaa'
  //   // });
  // }

  // void writeData() async {
  //   // Please replace the Database URL
  //   // which we will get in “Add Realtime
  //   // Database” step with DatabaseURL
  //   var url =
  //       "https://afen-japanese-default-rtdb.firebaseio.com/" + "data.json";

  //   // (Do not remove “data.json”,keep it as it is)
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: json.encode({"title": "123"}),
  //     );
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
