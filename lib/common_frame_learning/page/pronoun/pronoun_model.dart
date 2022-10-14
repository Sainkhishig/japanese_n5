import 'package:freezed_annotation/freezed_annotation.dart';

part 'pronoun_model.freezed.dart';
part 'pronoun_model.g.dart';

@freezed
abstract class PronounModel with _$PronounModel {
  const factory PronounModel({
    @Default("") String title,
    @Default(1) int selectedCardIndex,
    @Default([]) List<dynamic> lstLetter,
    @Default([]) List<dynamic> lstSample,
  }) = _PronounModel;
  factory PronounModel.fromJson(Map<String, dynamic> json) =>
      _$PronounModelFromJson(json);
}
