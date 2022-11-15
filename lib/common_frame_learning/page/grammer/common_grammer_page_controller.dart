import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hishig_erdem/n5/reference_n5_common_model.dart';

final commonGrammerPageProvider =
    StateNotifierProvider<CommonGrammarPageController, VocabularyModel>((ref) {
  return CommonGrammarPageController(widgetRef: ref);
});

class CommonGrammarPageController extends StateNotifier<VocabularyModel> {
  CommonGrammarPageController({required this.widgetRef})
      : super(const VocabularyModel());

  final StateNotifierProviderRef widgetRef;
  @override
  VocabularyModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonGrammerPageProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSearchKey(String key) async {
    print("parapmKey:$key");
    state = state.copyWith(searchKey: key);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }
}
