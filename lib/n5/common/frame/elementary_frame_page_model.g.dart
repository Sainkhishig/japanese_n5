// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elementary_frame_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ElementaryFramePageModel _$$_ElementaryFramePageModelFromJson(
        Map<String, dynamic> json) =>
    _$_ElementaryFramePageModel(
      railIndex: json['railIndex'] as int? ?? 0,
      status: json['status'] as bool? ?? false,
      isGameMode: json['isGameMode'] as bool? ?? false,
      isShowSpeech: json['isShowSpeech'] as bool? ?? true,
      masterDataDestination:
          json['masterDataDestination'] as String? ?? 'letter',
      vocabularyMenuDestination:
          json['vocabularyMenuDestination'] as String? ?? 'vocabularyN5',
    );

Map<String, dynamic> _$$_ElementaryFramePageModelToJson(
        _$_ElementaryFramePageModel instance) =>
    <String, dynamic>{
      'railIndex': instance.railIndex,
      'status': instance.status,
      'isGameMode': instance.isGameMode,
      'isShowSpeech': instance.isShowSpeech,
      'masterDataDestination': instance.masterDataDestination,
      'vocabularyMenuDestination': instance.vocabularyMenuDestination,
    };
