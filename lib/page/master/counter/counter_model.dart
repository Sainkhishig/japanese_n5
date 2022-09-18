import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@freezed
abstract class CounterModel with _$CounterModel {
  const factory CounterModel({
    @Default("") String title,
    @Default(1) int selectedCardIndex,
    @Default([]) List<dynamic> lstWordGroup,
  }) = _CounterModel;
  factory CounterModel.fromJson(Map<String, dynamic> json) =>
      _$CounterModelFromJson(json);
}
