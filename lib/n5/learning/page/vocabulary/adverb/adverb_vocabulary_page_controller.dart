import 'package:hishig_erdem/n5/reference_n5_common_model.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/hive_db/object/dictionary.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider =
    StateNotifierProvider<AdverbVocabularyPageController, VocabularyModel>(
        (ref) {
  return AdverbVocabularyPageController(widgetRef: ref);
});

class AdverbVocabularyPageController extends StateNotifier<VocabularyModel> {
  AdverbVocabularyPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences preferences;
  bool? get isShowPreference => preferences.getBool("isShowSpeechIcon");

  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocListProvider);
    preferences = ref.read(sharedPreferencesProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSearchKey(String key) async {
    state = state.copyWith(searchKey: key);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }
}
