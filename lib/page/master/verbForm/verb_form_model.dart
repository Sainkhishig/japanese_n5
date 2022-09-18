import 'package:freezed_annotation/freezed_annotation.dart';

part 'verb_form_model.freezed.dart';
part 'verb_form_model.g.dart';

@freezed
abstract class VerbFormModel with _$VerbFormModel {
  const factory VerbFormModel({
    @Default("") String title,
    @Default(1) int selectedCardIndex,
    @Default([]) List<dynamic> lstVerbForms,
  }) = _VerbFormModel;
  factory VerbFormModel.fromJson(Map<String, dynamic> json) =>
      _$VerbFormModelFromJson(json);
}
