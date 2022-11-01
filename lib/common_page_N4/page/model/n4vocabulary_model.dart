import 'package:freezed_annotation/freezed_annotation.dart';

part 'n4vocabulary_model.freezed.dart';
part 'n4vocabulary_model.g.dart';

@freezed
abstract class N4VocabularyModel with _$N4VocabularyModel {
  const factory N4VocabularyModel({
    @Default([]) List<dynamic> lstVocabulary,
    @Default(1) int selectedCardIndex,
    @Default(1) int pageIndex,
    @Default("N5Words") String dbName,
    @Default(0) int dbNameIndex,
    @Default("") String searchKey,
  }) = _N4VocabularyModel;
  factory N4VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$N4VocabularyModelFromJson(json);
}
