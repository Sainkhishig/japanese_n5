import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_serving_progress_model.freezed.dart';
part 'table_serving_progress_model.g.dart';

@freezed
abstract class TableServingProgressModel with _$TableServingProgressModel {
  const factory TableServingProgressModel({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default("") String searchKey,
  }) = _TableServingProgressModel;
  factory TableServingProgressModel.fromJson(Map<String, dynamic> json) =>
      _$TableServingProgressModelFromJson(json);
}
