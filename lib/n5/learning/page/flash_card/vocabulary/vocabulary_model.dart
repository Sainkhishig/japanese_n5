import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hishig_erdem/hive_db/object/dictionary.dart';

part 'vocabulary_model.freezed.dart';
part 'vocabulary_model.g.dart';

@freezed
abstract class VocabularyModel with _$VocabularyModel {
  const factory VocabularyModel({
    @Default([]) List lstVocabulary,
    @Default(1) int selectedCardIndex,
    @Default(1) int pageIndex,
    @Default("N5Words") String dbName,
    @Default(0) int dbNameIndex,
    @Default("") String searchKey,
  }) = _VocabularyModel;
  factory VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);
}
