import 'package:freezed_annotation/freezed_annotation.dart';

part 'n5_common_page_model.freezed.dart';
part 'n5_common_page_model.g.dart';

@freezed
abstract class N5CommonPageModel with _$N5CommonPageModel {
  const factory N5CommonPageModel({
    @Default(0) int railIndex,
    @Default(false) bool status,
    // @Default(0) int selectedIndex,
    @Default(false) bool isGameMode,
    @Default(true) bool isShowSpeech,
    @Default("letter") String masterDataDestination,
    @Default("vocabularyN5") String vocabularyMenuDestination,
  }) = _N5CommonPageModel;
  factory N5CommonPageModel.fromJson(Map<String, dynamic> json) =>
      _$N5CommonPageModelFromJson(json);
}
