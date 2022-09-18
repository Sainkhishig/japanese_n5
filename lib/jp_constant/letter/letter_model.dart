import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_model.freezed.dart';
part 'letter_model.g.dart';

@freezed
abstract class LetterModel with _$LetterModel {
  const factory LetterModel({
    @Default("") String title,
    @Default(0) int selectedCardIndex,
    @Default([]) List<dynamic> lstLetter,
    @Default([]) List<dynamic> lstSample,
  }) = _LetterModel;
  factory LetterModel.fromJson(Map<String, dynamic> json) =>
      _$LetterModelFromJson(json);
}
