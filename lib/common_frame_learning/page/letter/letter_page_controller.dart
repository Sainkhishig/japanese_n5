import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'letter_model.dart';

final letterCardProvider =
    StateNotifierProvider<LetterPageController, LetterModel>((ref) {
  return LetterPageController(widgetRef: ref);
});

class LetterPageController extends StateNotifier<LetterModel> {
  LetterPageController({required this.widgetRef}) : super(const LetterModel());

  final StateNotifierProviderRef widgetRef;
  @override
  LetterModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(letterCardProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }
}
