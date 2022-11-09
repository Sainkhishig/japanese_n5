import 'package:freezed_annotation/freezed_annotation.dart';

part 'n5_test_frame_page_model.freezed.dart';
part 'n5_test_frame_page_model.g.dart';

@freezed
abstract class N5TestFramePageModel with _$N5TestFramePageModel {
  const factory N5TestFramePageModel({
    @Default(null) String? facilityId,
    @Default(0) int railIndex,
    @Default(false) bool status,
    @Default("") String userName,
    @Default("") String title,
    @Default(0) int selectedIndex,
    @Default(false) bool isGameMode,
    @Default(true) bool isShowSpeech,
    @Default("letter") String masterDataDestination,
    @Default("allVocabulary") String vocabularyMenuDestination,
  }) = _N5TestFramePageModel;
  factory N5TestFramePageModel.fromJson(Map<String, dynamic> json) =>
      _$N5TestFramePageModelFromJson(json);
}
