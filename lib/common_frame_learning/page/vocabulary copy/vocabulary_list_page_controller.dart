import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final vocListProvider =
    StateNotifierProvider<VocabularyListPageController, VocabularyModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController extends StateNotifier<VocabularyModel> {
  VocabularyListPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VocabularyModel get state;
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
