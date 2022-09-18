
import 'package:afen_vocabulary/page/master/number_day/master_data_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final masterDataGameProvider =
    StateNotifierProvider<MasterDataGamePageController, MasterDataModel>((ref) {
  return MasterDataGamePageController(widgetRef: ref);
});

class MasterDataGamePageController extends StateNotifier<MasterDataModel> {
  MasterDataGamePageController({required this.widgetRef})
      : super(const MasterDataModel());

  final StateNotifierProviderRef widgetRef;
  @override
  MasterDataModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(masterDataGameProvider);
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
