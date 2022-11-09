// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n5_test_frame_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_N5TestFramePageModel _$$_N5TestFramePageModelFromJson(
        Map<String, dynamic> json) =>
    _$_N5TestFramePageModel(
      facilityId: json['facilityId'] as String? ?? null,
      railIndex: json['railIndex'] as int? ?? 0,
      status: json['status'] as bool? ?? false,
      userName: json['userName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      selectedIndex: json['selectedIndex'] as int? ?? 0,
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
      'facilityId': instance.facilityId,
      'railIndex': instance.railIndex,
      'status': instance.status,
      'userName': instance.userName,
      'title': instance.title,
      'selectedIndex': instance.selectedIndex,
      'isGameMode': instance.isGameMode,
      'isShowSpeech': instance.isShowSpeech,
      'masterDataDestination': instance.masterDataDestination,
      'vocabularyMenuDestination': instance.vocabularyMenuDestination,
    };
