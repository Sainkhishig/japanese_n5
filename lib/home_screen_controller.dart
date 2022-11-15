import 'package:hishig_erdem/common/function/read_xl_logic.dart';
import 'package:hishig_erdem/n5/learning/page/flash_card/vocabulary/vocabulary_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeScreenController =
    StateNotifierProvider<HomeScreenController, VocabularyModel>(
        (ref) => HomeScreenController(ref: ref));

class HomeScreenController extends StateNotifier<VocabularyModel> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  HomeScreenController({required this.ref}) : super(const VocabularyModel());
  //#endregion ==================== constructor ====================

  //#endregion ---------- get ----------

  //#region ---------- save ----------
  Future<void> loadKanji() async => await readKanji(ref);
  Future<void> loadGrammar() async => await readGrammar(ref);
  Future<void> loadVocabulary() async => await readVocabulary(ref);

  //#endregion ---------- save ----------

  //#endregion ==================== method ====================
}
