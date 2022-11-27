import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanji_test_state.freezed.dart';
part 'kanji_test_state.g.dart';

@freezed
abstract class KanjiTestState with _$KanjiTestState {
  const factory KanjiTestState({
    @Default([]) List tags,
    @Default([]) List kanjiTestSource,
    @Default(null) String? selectedId,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _KanjiTestState;
  factory KanjiTestState.fromJson(Map<String, dynamic> json) =>
      _$KanjiTestStateFromJson(json);
}
