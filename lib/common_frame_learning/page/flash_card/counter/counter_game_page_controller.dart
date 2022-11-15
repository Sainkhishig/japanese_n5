import 'package:hishig_erdem/n5/learning/page/master/counter/counter_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final counterGamePageProvider =
    StateNotifierProvider<CounterGamePageController, CounterModel>((ref) {
  return CounterGamePageController(widgetRef: ref);
});

class CounterGamePageController extends StateNotifier<CounterModel> {
  CounterGamePageController({required this.widgetRef})
      : super(const CounterModel());

  final StateNotifierProviderRef widgetRef;
  @override
  CounterModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(counterGamePageProvider);
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
