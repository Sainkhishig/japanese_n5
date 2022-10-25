import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_model.freezed.dart';
part 'common_model.g.dart';

@freezed
abstract class CommonPageModel with _$CommonPageModel {
  const factory CommonPageModel({
    @Default("") String userName,
    @Default("") String title,
    @Default(0) int selectedIndex,
    @Default(false) bool isGameMode,
    @Default(true) bool isShowSpeech,
    @Default("letter") String masterDataDestination,
    @Default("allVocabulary") String vocabularyMenuDestination,
  }) = _CommonPageModel;
  factory CommonPageModel.fromJson(Map<String, dynamic> json) =>
      _$CommonPageModelFromJson(json);
}
