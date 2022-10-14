import 'package:afen_vocabulary/common_frame_learning/page/pronoun/pronoun_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final letterGameProvider =
    StateNotifierProvider<LetterCardPageController, PronounModel>((ref) {
  return LetterCardPageController(widgetRef: ref);
});

class LetterCardPageController extends StateNotifier<PronounModel> {
  LetterCardPageController({required this.widgetRef})
      : super(const PronounModel());

  final StateNotifierProviderRef widgetRef;
  @override
  PronounModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(letterGameProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
