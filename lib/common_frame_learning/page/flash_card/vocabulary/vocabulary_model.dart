import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_model.freezed.dart';
part 'vocabulary_model.g.dart';

@freezed
abstract class VocabularyModel with _$VocabularyModel {
  const factory VocabularyModel({
    @Default([]) List<dynamic> lstVocabulary,
    @Default(1) int selectedCardIndex,
    @Default(1) int pageIndex,
    @Default("N5Words") String dbName,
    @Default(0) int dbNameIndex,
    @Default("") String searchKey,
  }) = _VocabularyModel;
  factory VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);
}
