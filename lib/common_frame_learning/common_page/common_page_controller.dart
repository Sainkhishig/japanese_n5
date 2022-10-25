import 'package:afen_vocabulary/common_providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import 'common_model.dart';

final commonPageProvider =
    StateNotifierProvider<CommonPageController, CommonPageModel>((ref) {
  return CommonPageController(widgetRef: ref);
});

class CommonPageController extends StateNotifier<CommonPageModel> {
  CommonPageController({required this.widgetRef})
      : super(const CommonPageModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");
  @override
  CommonPageModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonPageProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedIndex: index);
  }

  setVocabularyDestination(String destination) async {
    state = state.copyWith(vocabularyMenuDestination: destination);
  }

  setMasterDataDestination(String masterDest) async {
    state = state.copyWith(masterDataDestination: masterDest);
  }

  setGameMode(bool isGameMode) async {
    state = state.copyWith(isGameMode: isGameMode);
  }

  setSpeechVisible(bool isShow) async {
    var preferences = widgetRef.read(sharedPreferencesProvider);
    await preferences.setBool("isShowSpeechIcon", isShow);
    state = state.copyWith(isShowSpeech: isShow);
  }

  refreshState(String? uuid) async {
    state = state.copyWith(userName: uuid ?? "");
  }
}
