import 'package:afen_vocabulary/page/pronoun/pronoun_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final letterGameProvider =
    StateNotifierProvider<LetterGamePageController, PronounModel>((ref) {
  return LetterGamePageController(widgetRef: ref);
});

class LetterGamePageController extends StateNotifier<PronounModel> {
  LetterGamePageController({required this.widgetRef})
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
