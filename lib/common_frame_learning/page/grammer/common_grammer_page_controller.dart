import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
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

  dynamic getHiveBox(int level) => getJlptBoxByLevel(widgetRef, level);
// getJlptBoxByLevel(StateNotifierProviderRef ref, int level) {
//   HiveBoxClass hiveBox;
//   switch (level) {
//     case 5:
//       hiveBox = ref.read(n5BoxDataProvider);
//       break;
//     case 4:
//       hiveBox = ref.read(n4BoxDataProvider);
//       break;
//     case 3:
//       hiveBox = ref.read(n3BoxDataProvider);
//       break;
//     case 2:
//       hiveBox = ref.read(n2BoxDataProvider);
//       break;
//     case 1:
//       hiveBox = ref.read(n1BoxDataProvider);
//       break;

//     default:
//       hiveBox = ref.read(n5BoxDataProvider);
//       break;
//   }
//   return hiveBox;
// }
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
