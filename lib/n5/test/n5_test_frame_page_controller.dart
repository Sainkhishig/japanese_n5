import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'n5_test_frame_page_model.dart';

final n5testFramePageProvider =
    StateNotifierProvider<N5TestFramePageController, N5TestFramePageModel>(
        (ref) {
  return N5TestFramePageController(ref: ref);
});

class N5TestFramePageController extends StateNotifier<N5TestFramePageModel> {
  N5TestFramePageController({required this.ref})
      : super(const N5TestFramePageModel());
  final StateNotifierProviderRef ref;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  void setModelListenable(WidgetRef ref) {
    ref.watch(n5testFramePageProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  void refresh() {
    state = state;
  }

  setMasterDataDestination(String masterDest) async {
    state = state.copyWith(masterDataDestination: masterDest);
  }

  setVocabularyDestination(String destination) async {
    state = state.copyWith(vocabularyMenuDestination: destination);
  }

  setGameMode(bool isGameMode) async {
    state = state.copyWith(isGameMode: isGameMode);
  }

  refreshState(String? uuid) async {
    state = state.copyWith(userName: uuid ?? "");
  }

  int get railIndex => state.railIndex;
  void setRailIndex(int index) {
    state = state.copyWith(railIndex: index);
  }

  setSpeechVisible(bool isShow) async {
    var preferences = ref.read(sharedPreferencesProvider);
    await preferences.setBool("isShowSpeechIcon", isShow);
    state = state.copyWith(isShowSpeech: isShow);
  }

  String? get facilityId => state.facilityId;
  set facilityId(String? value) => state = state.copyWith(facilityId: value);
}
