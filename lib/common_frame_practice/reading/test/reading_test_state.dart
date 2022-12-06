import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_test_state.freezed.dart';
part 'reading_test_state.g.dart';

@freezed
abstract class ReadingTestState with _$ReadingTestState {
  const factory ReadingTestState({
    @Default([]) List tags,
    @Default([]) List readingTestSource,
    @Default(null) String? selectedId,
    @Default(null) dynamic selectedReadingTest,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _ReadingTestState;
  factory ReadingTestState.fromJson(Map<String, dynamic> json) =>
      _$ReadingTestStateFromJson(json);
}
