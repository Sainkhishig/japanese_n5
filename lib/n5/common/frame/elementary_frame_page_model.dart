import 'package:freezed_annotation/freezed_annotation.dart';

part 'elementary_frame_page_model.freezed.dart';
part 'elementary_frame_page_model.g.dart';

@freezed
abstract class ElementaryFramePageModel with _$ElementaryFramePageModel {
  const factory ElementaryFramePageModel({
    @Default(0) int railIndex,
    @Default(false) bool status,
    // @Default(0) int selectedIndex,
    @Default(false) bool isGameMode,
    @Default(true) bool isShowSpeech,
    @Default("letter") String masterDataDestination,
    @Default("vocabularyN5") String vocabularyMenuDestination,
  }) = _ElementaryFramePageModel;
  factory ElementaryFramePageModel.fromJson(Map<String, dynamic> json) =>
      _$ElementaryFramePageModelFromJson(json);
}
