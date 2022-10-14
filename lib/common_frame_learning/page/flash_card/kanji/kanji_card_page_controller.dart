import 'package:afen_vocabulary/common_frame_learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final kanjiCardProvider =
    StateNotifierProvider<KanjiCardPageController, VocabularyModel>((ref) {
  return KanjiCardPageController(widgetRef: ref);
});

class KanjiCardPageController extends StateNotifier<VocabularyModel> {
  KanjiCardPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(kanjiCardProvider);
  }

  void setLevel(int level) {
    state = state.copyWith(pageIndex: level);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
