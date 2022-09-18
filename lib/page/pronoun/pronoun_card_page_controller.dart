import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'pronoun_model.dart';

final letterCardProvider =
    StateNotifierProvider<PronounCardPageController, PronounModel>((ref) {
  return PronounCardPageController(widgetRef: ref);
});

class PronounCardPageController extends StateNotifier<PronounModel> {
  PronounCardPageController({required this.widgetRef})
      : super(const PronounModel());

  final StateNotifierProviderRef widgetRef;
  @override
  PronounModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(letterCardProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }
}
