// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n5_test_frame_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_N5TestFramePageModel _$$_N5TestFramePageModelFromJson(
        Map<String, dynamic> json) =>
    _$_N5TestFramePageModel(
      railIndex: json['railIndex'] as int? ?? 0,
      status: json['status'] as bool? ?? false,
      isGameMode: json['isGameMode'] as bool? ?? false,
      isShowSpeech: json['isShowSpeech'] as bool? ?? true,
      masterDataDestination:
          json['masterDataDestination'] as String? ?? 'letter',
      vocabularyMenuDestination:
          json['vocabularyMenuDestination'] as String? ?? 'allVocabulary',
    );

Map<String, dynamic> _$$_N5TestFramePageModelToJson(
        _$_N5TestFramePageModel instance) =>
    <String, dynamic>{
      'railIndex': instance.railIndex,
      'status': instance.status,
      'isGameMode': instance.isGameMode,
      'isShowSpeech': instance.isShowSpeech,
      'masterDataDestination': instance.masterDataDestination,
      'vocabularyMenuDestination': instance.vocabularyMenuDestination,
    };
