
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'counter_model.dart';

final counterPageProvider =
    StateNotifierProvider<CounterPageController, CounterModel>((ref) {
  return CounterPageController(widgetRef: ref);
});

class CounterPageController extends StateNotifier<CounterModel> {
  CounterPageController({required this.widgetRef})
      : super(const CounterModel());

  final StateNotifierProviderRef widgetRef;
  @override
  CounterModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(counterPageProvider);
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
