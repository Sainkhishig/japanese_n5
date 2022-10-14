import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_model.freezed.dart';
part 'vocabulary_model.g.dart';

@freezed
abstract class VocabularyModel with _$VocabularyModel {
  const factory VocabularyModel({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default("") String searchKey,
  }) = _VocabularyModel;
  factory VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);
}