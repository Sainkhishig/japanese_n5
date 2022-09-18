import 'package:afen_vocabulary/card/table_serving_progress_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider = StateNotifierProvider<VocabularyListPageController,
    TableServingProgressModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController
    extends StateNotifier<TableServingProgressModel> {
  VocabularyListPageController({required this.widgetRef})
      : super(const TableServingProgressModel());

  final StateNotifierProviderRef widgetRef;
  @override
  TableServingProgressModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(vocListProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }
}
