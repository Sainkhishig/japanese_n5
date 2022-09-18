import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_vocabulary_model.freezed.dart';
part 'import_vocabulary_model.g.dart';

@freezed
abstract class ImportVocabularyModel with _$ImportVocabularyModel {
  const factory ImportVocabularyModel({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
  }) = _ImportVocabularyModel;
  factory ImportVocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$ImportVocabularyModelFromJson(json);
}
// {
//       'level': 5,
//       'word': "ほん",
//       'kanji': "本",
//       'translation': "ном",
//       'example': "つくえのに本がふたつあります。",
//       'example_en': "つくえのに本がふたつあります。",
//       'example_mn': "Ширээн дээр ном 2 ширхэг байна.",
//       'time': DateTime.now().microsecondsSinceEpoch
//     };