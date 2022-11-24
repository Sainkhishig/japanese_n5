import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_test_state.freezed.dart';
part 'listening_test_state.g.dart';

@freezed
abstract class ListeningTestState with _$ListeningTestState {
  const factory ListeningTestState({
    @Default([]) List tags,
    @Default(null) String? selectedId,
    // @Default(PlanType.lodging) PlanType planType,
    // @Default(DetailMode.none) DetailMode mode,
    // @Default(SearchStatus.none) SearchStatus searchStatus,
    // @Default(null) List<FacilityPlanModel>? resultList,
  }) = _ListeningTestState;
  factory ListeningTestState.fromJson(Map<String, dynamic> json) =>
      _$ListeningTestStateFromJson(json);
}
