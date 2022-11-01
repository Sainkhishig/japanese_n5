import 'package:freezed_annotation/freezed_annotation.dart';

part 'n4common_model.freezed.dart';
part 'n4common_model.g.dart';

@freezed
abstract class N4CommonPageModel with _$N4CommonPageModel {
  const factory N4CommonPageModel({
    @Default("") String userName,
    @Default("") String title,
    @Default(0) int selectedIndex,
    @Default(false) bool isGameMode,
    @Default(true) bool isShowSpeech,
    @Default("letter") String masterDataDestination,
    @Default("allVocabulary") String vocabularyMenuDestination,
  }) = _N4CommonPageModel;
  factory N4CommonPageModel.fromJson(Map<String, dynamic> json) =>
      _$N4CommonPageModelFromJson(json);
}
