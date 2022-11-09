import 'dart:convert';

import 'package:hishig_erdem/n5/learning/page/letter/letter_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final letterGameProvider =
    StateNotifierProvider<LetterCardPageController, LetterModel>((ref) {
  return LetterCardPageController(widgetRef: ref);
});

class LetterCardPageController extends StateNotifier<LetterModel> {
  LetterCardPageController({required this.widgetRef})
      : super(const LetterModel());

  final StateNotifierProviderRef widgetRef;
  @override
  LetterModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(letterGameProvider);
  }

  // void setLevel(int level) {
  //   state = state.copyWith(jlptLevel: level);
  // }

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
