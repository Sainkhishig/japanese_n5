import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_test_state.freezed.dart';
part 'grammar_test_state.g.dart';

@freezed
abstract class GrammarTestState with _$GrammarTestState {
  const factory GrammarTestState({
    @Default([]) List tags,
    @Default([]) List grammarTestSource,
    @Default(null) String? selectedId,
    @Default(null) dynamic selectedGrammarTest,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _GrammarTestState;
  factory GrammarTestState.fromJson(Map<String, dynamic> json) =>
      _$GrammarTestStateFromJson(json);
}
